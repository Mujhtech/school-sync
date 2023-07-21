import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

extension ContextExtensions on BuildContext {
  double screenWidth([double value = 1]) =>
      MediaQuery.of(this).size.width * value;
  double screenHeight([double value = 1]) =>
      MediaQuery.of(this).size.height * value;

  AppRouter get router => AppRouter(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get textColor {
    if (Theme.of(this).brightness == Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }

  Color get buttonTextColor {
    if (Theme.of(this).brightness == Brightness.dark) {
      return Colors.black;
    }

    return Colors.white;
  }

  Color get buttonColor {
    if (Theme.of(this).brightness == Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }
}

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    if (length == 1) {
      return toUpperCase();
    }
    return this[0].toUpperCase() + substring(1);
  }

  String sentence() => split(' ').map((_) => _.capitalize()).join(' ');
}