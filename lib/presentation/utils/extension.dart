import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

extension ContextExtensions on BuildContext {
  double screenWidth([double value = 1]) =>
      MediaQuery.of(this).size.width * value;
  double screenHeight([double value = 1]) =>
      MediaQuery.of(this).size.height * value;

  double get navbarWidth {
    if (MediaQuery.of(this).size.width > 1350) {
      return MediaQuery.of(this).size.width * 0.15;
    }

    if (MediaQuery.of(this).size.width > 900) {
      return MediaQuery.of(this).size.width * 0.2;
    }

    return MediaQuery.of(this).size.width * 0.25;
  }

  AppRouter get router => AppRouter(this);

  AppSnackBar get snackBar => AppSnackBar.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get textColor {
    if (Theme.of(this).brightness == Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }

  Color get textColorWithOpacity {
    if (Theme.of(this).brightness == Brightness.dark) {
      return Colors.white.withOpacity(0.5);
    }

    return Colors.black.withOpacity(0.5);
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

  String get firstLetter {
    return this[0];
  }
}

extension PricingRecurrenceExtensions on PricingRecurrence {
  int get months {
    if (this == PricingRecurrence.yearly) {
      return 12;
    }

    return 1;
  }
}
