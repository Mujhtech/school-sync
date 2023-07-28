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
    this.currentUserId,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final ThemeMode? themeMode;
  final Widget? home;
  final List<NavigatorObserver>? navigatorObservers;
  final String? currentUserId;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: themeBuilder(ThemeData.light()),
        darkTheme: themeBuilder(ThemeData.dark()),
        themeMode:
            ref.watch(preferencesProvider.select((_) => _.value?.themeMode)) ??
                widget.themeMode,
        navigatorKey: widget.navigatorKey,
        onGenerateTitle: (BuildContext context) => AppString.appName,
        home: child,
        builder: (_, Widget? child) =>
            SnackBarProvider(navigatorKey: widget.navigatorKey, child: child!),
        navigatorObservers: widget.navigatorObservers ?? <NavigatorObserver>[],
      ),
      child: widget.currentUserId != null && widget.currentUserId!.isNotEmpty
          ? const SelectSchoolPage()
          : const LoginPage(),
    );
  }
}
