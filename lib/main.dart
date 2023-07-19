import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NavigatorObserver navigationObserver = NavigatorObserver();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final SharedPreferences storage = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: <Override>[],
    child: App(
      navigatorKey: navigatorKey,
      navigatorObservers: [navigationObserver],
    ),
  ));
}
