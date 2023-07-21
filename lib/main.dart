import 'dart:async' as async;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart' as io;

// import 'package:shared_preferences/shared_preferences.dart';
import 'core.dart';
import 'presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NavigatorObserver navigationObserver = NavigatorObserver();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //final SharedPreferences storage = await SharedPreferences.getInstance();
  final DeviceInformation deviceInformation =
      await AppDeviceInformation.initialize();

  final _ReporterClient reporterClient = _ReporterClient(
    deviceInformation: deviceInformation,
    isReleased: kDebugMode,
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

  runApp(
    ProviderScope(
      overrides: const <Override>[],
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
  async.FutureOr<void> report(
      {required StackTrace stackTrace,
      required Object error,
      Object? extra}) async {
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
