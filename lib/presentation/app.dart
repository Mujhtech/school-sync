import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.navigatorKey,
    this.themeMode,
    this.home,
    this.navigatorObservers,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final ThemeMode? themeMode;
  final Widget? home;
  final List<NavigatorObserver>? navigatorObservers;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeBuilder(ThemeData.light()),
        darkTheme: themeBuilder(ThemeData.dark()),
        // themeMode: ThemeMode.system,
        navigatorKey: widget.navigatorKey,
        home: child,
        navigatorObservers: widget.navigatorObservers ?? <NavigatorObserver>[],
      ),
      child: const LoginPage(),
    );
  }
}
