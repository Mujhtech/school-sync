import 'dart:async' as async;

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:registry/registry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:universal_io/io.dart' as io;

import 'core.dart';
import 'data.dart';
import 'domain.dart';
import 'presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  final NavigatorObserver navigationObserver = NavigatorObserver();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final SharedPreferences storage = await SharedPreferences.getInstance();
  final DeviceInformation deviceInformation =
      await AppDeviceInformation.initialize();

  final _ReporterClient reporterClient = _ReporterClient(
    deviceInformation: deviceInformation,
    isReleased: kDebugMode,
  );

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  final SupabaseClient supabase = Supabase.instance.client;

  StringLocalStorage authIdentityStorage;

  if (kDebugMode) {
    authIdentityStorage = _SharedPreferencesAuthIdentityStorage(storage);
  } else {
    authIdentityStorage =
        const _SecureStorageAuthIdentityStorage(FlutterSecureStorage());
  }

  final _ThemeModeStorage themeModeStorage = _ThemeModeStorage(storage);

  final PreferencesRepository preferences =
      PreferencesLocalImpl(themeModeStorage);

  final _CurrentSchoolIdStorage currentSchoolIdStorage =
      _CurrentSchoolIdStorage(storage);

  final CurrentSchoolIdRepository currentSchool =
      CurrentSchoolIdLocalImpl(currentSchoolIdStorage);

  final _Repository repository = _Repository.local(
    // !kDebugMode
    Database(await _LocalDatabaseUtility.location()),
    // : Database.memory(),
    supabase,
    currentSchool: currentSchool,
    authIdentityStorage: authIdentityStorage,
    preferences: preferences,
  );

  final RemoteDatabase remoteDatabase = RemoteDatabase(supabase);

  final ErrorReporter errorReporter = ErrorReporter(client: reporterClient);
  AppLog.init(
    logFilter: () => false,
    exceptionFilter: (Object error) {
      const List<Type> ignoreTypes = <Type>[
        io.SocketException,
        io.HandshakeException,
        async.TimeoutException,
      ];
      return !ignoreTypes.contains(error.runtimeType);
    },
    onException: errorReporter.report,
    onLog: (Object? message) => debugPrint(message?.toString()),
  );

  final Registry registry = Registry()

    /// Repositories.
    ..set(supabase)
    ..set(storage)
    ..set(remoteDatabase)
    ..set(repository.auth)
    ..set(repository.users)
    ..set(repository.schools)
    ..set(repository.preferences)
    ..set(repository.currentSchool)

    /// UseCases.
    ..factory((RegistryFactory di) => RegisterUseCase(auth: di()))
    ..factory((RegistryFactory di) => LoginUseCase(auth: di()))
    ..factory((RegistryFactory di) => CreateUserUseCase(users: di()))
    ..factory((RegistryFactory di) => FetchUserUseCase(users: di(), auth: di()))

    //
    ..factory(
      (RegistryFactory di) =>
          CreateSchoolUseCase(schools: di(), remoteDatabase: di()),
    )
    ..factory((RegistryFactory di) => FetchSchoolsUseCase(schools: di()))
    ..factory((RegistryFactory di) => FetchSchoolsUseCase(schools: di()))
    //
    ..factory((RegistryFactory di) => UpdateAppThemeUseCase(preferences: di()))
    ..factory((RegistryFactory di) => FetchAppThemeUseCase(preferences: di()))

    ///
    ..factory(
      (RegistryFactory di) => UpdateCurrentSchoolIdUseCase(currentSchool: di()),
    )
    ..factory(
      (RegistryFactory di) => FetchCurrentSchoolIdUseCase(currentSchool: di()),
    )

    /// Repositories.
    ..set(kDebugMode);

  final String? userId = await authIdentityStorage.get();

  runApp(
    ProviderScope(
      overrides: <Override>[
        registryProvider.overrideWithValue(registry),
        appVersionProvider.overrideWithValue(deviceInformation.appVersion),
      ],
      child: ErrorBoundary(
        errorViewBuilder: (_) => const AppCrashErrorView(),
        onException: AppLog.e,
        onCrash: errorReporter.reportCrash,
        child: App(
          navigatorKey: navigatorKey,
          navigatorObservers: <NavigatorObserver>[navigationObserver],
          currentUserId: userId,
          themeMode: (await themeModeStorage.get())?.themeMode,
        ),
      ),
    ),
  );

  doWhenWindowReady(() {
    // const Size initialSize = Size(600, 450);
    // appWindow.minSize = initialSize;
    // appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class _ReporterClient implements ReporterClient {
  _ReporterClient({
    required this.deviceInformation,
    required this.isReleased,
  });

  final DeviceInformation deviceInformation;
  final bool isReleased;
  final Set<_ReporterErrorEvent> _events = <_ReporterErrorEvent>{};

  @override
  async.FutureOr<void> report({
    required StackTrace stackTrace,
    required Object error,
    Object? extra,
  }) async {
    _events.add(
      (
        error: error,
        stackTrace: stackTrace,
        environment: isReleased ? 'prod' : 'dev',
        deviceInformation: deviceInformation.toMap(),
        extra: extra is Map
            ? extra as Map<String, dynamic>?
            : <String, dynamic>{'extra': extra},
      ),
    );
  }

  @override
  // TODO(Jogboms): handle crash
  async.FutureOr<void> reportCrash(FlutterErrorDetails details) {}

  @override
  void log(Object object) => AppLog.i(object);
}

typedef _ReporterErrorEvent = ({
  Object error,
  StackTrace stackTrace,
  String environment,
  Map<String, String> deviceInformation,
  Map<String, dynamic>? extra,
});

class _Repository {
  _Repository.local(
    Database db,
    SupabaseClient supabase, {
    required StringLocalStorage authIdentityStorage,
    required this.preferences,
    required this.currentSchool,
  })  : auth = AuthRemoteImpl(supabase, authIdentityStorage),
        users = UsersLocalImpl(db),
        schools = SchoolsLocalImpl(db);

  final AuthRepository auth;
  final UsersRepository users;
  final SchoolsRepository schools;
  final CurrentSchoolIdRepository currentSchool;
  final PreferencesRepository preferences;
}

class _LocalDatabaseUtility {
  static const String _dbName = 'db.sqlite';

  static Future<String> location() async =>
      p.join(await _deriveDirectoryPath(), _dbName);

  static Future<String> _deriveDirectoryPath() => (io.Platform.isIOS
          ? getLibraryDirectory()
          : getApplicationDocumentsDirectory())
      .then((_) => _.path);
}

class _SecureStorageAuthIdentityStorage implements StringLocalStorage {
  const _SecureStorageAuthIdentityStorage(this._storage);

  final FlutterSecureStorage _storage;
  static const String _key = 'school.sync.user.id';

  @override
  async.FutureOr<String?> get() => _storage.read(key: _key);

  @override
  async.FutureOr<void> set(String id) => _storage.write(key: _key, value: id);
}

class _SharedPreferencesAuthIdentityStorage implements StringLocalStorage {
  const _SharedPreferencesAuthIdentityStorage(this._storage);

  final SharedPreferences _storage;
  static const String _key = 'school.sync.user.id';

  @override
  async.FutureOr<String?> get() => _storage.getString(_key);

  @override
  async.FutureOr<void> set(String id) => _storage.setString(_key, id);
}

class _ThemeModeStorage implements ThemeModeStorage {
  const _ThemeModeStorage(this._storage);

  final SharedPreferences _storage;
  static const String _key = 'school.sync.theme_mode';

  @override
  async.FutureOr<int?> get() => _storage.getInt(_key);

  @override
  async.FutureOr<void> set(int themeMode) => _storage.setInt(_key, themeMode);
}

class _CurrentSchoolIdStorage implements StringLocalStorage {
  const _CurrentSchoolIdStorage(this._storage);

  final SharedPreferences _storage;
  static const String _key = 'school.sync.current_school_id';

  @override
  async.FutureOr<String?> get() => _storage.getString(_key);

  @override
  async.FutureOr<bool> set(String value) => _storage.setString(_key, value);
}

extension on int {
  ThemeMode get themeMode => ThemeMode.values[this];
}
