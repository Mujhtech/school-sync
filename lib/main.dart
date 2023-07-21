import 'dart:async' as async;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registry/registry.dart';
import 'package:school_sync/data/repositories/user/user_local_impl.dart';
import 'package:school_sync/domain/use_cases/create_user_use_case.dart';
import 'package:school_sync/domain/use_cases/fetch_user_use_case.dart';
import 'package:school_sync/domain/use_cases/login_use_case.dart';
import 'package:school_sync/domain/use_cases/register_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:universal_io/io.dart' as io;

// import 'package:shared_preferences/shared_preferences.dart';
import 'core.dart';
import 'data.dart';
import 'domain.dart';
import 'presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  final NavigatorObserver navigationObserver = NavigatorObserver();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //final SharedPreferences storage = await SharedPreferences.getInstance();
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

  final _Repository repository = _Repository.local(
    Database.memory(),
    supabase,
    //preferences: PreferencesLocalImpl(themeModeStorage),
  );

  final ErrorReporter errorReporter = ErrorReporter(client: reporterClient);
  AppLog.init(
    logFilter: () => kDebugMode,
    exceptionFilter: (Object error) {
      const List<Type> ignoreTypes = <Type>[
        io.SocketException,
        io.HandshakeException,
        async.TimeoutException,
      ];
      return !kDebugMode && !ignoreTypes.contains(error.runtimeType);
    },
    onException: errorReporter.report,
    onLog: (Object? message) => debugPrint(message?.toString()),
  );

  final Registry registry = Registry()

    /// Repositories.
    ..set(supabase)
    ..set(repository.auth)
    ..set(repository.users)

    /// UseCases.
    ..factory((RegistryFactory di) => RegisterUseCase(auth: di()))
    ..factory((RegistryFactory di) => LoginUseCase(auth: di()))
    ..factory((RegistryFactory di) => CreateUserUseCase(users: di()))
    ..factory((RegistryFactory di) => FetchUserUseCase(users: di()))

    /// Repositories.
    ..set(kDebugMode);

  runApp(
    ProviderScope(
      overrides: <Override>[
        registryProvider.overrideWithValue(registry),
        appVersionProvider.overrideWithValue(deviceInformation.appVersion),
      ],
      child: ErrorBoundary(
        isReleaseMode: kDebugMode,
        errorViewBuilder: (_) => const AppCrashErrorView(),
        onException: AppLog.e,
        onCrash: errorReporter.reportCrash,
        child: App(
          navigatorKey: navigatorKey,
          navigatorObservers: <NavigatorObserver>[navigationObserver],
        ),
      ),
    ),
  );
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
  _Repository.local(Database db, SupabaseClient supabase)
      : auth = AuthRemoteImpl(supabase),
        users = UsersLocalImpl(db);

  final AuthRepository auth;
  final UsersRepository users;
}
