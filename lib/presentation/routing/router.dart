import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

import 'app_routes.dart';

class AppRouter {
  const AppRouter(this._context);

  final BuildContext _context;

  void pop() => Navigator.of(_context).pop();

  Future<void> goToSelectSchool() =>
      _goTo((_) => const SelectSchoolPage(), AppRoutes.selectSchool);

  Future<T?> _goTo<T>(WidgetBuilder builder, String name) =>
      Navigator.of(_context).push<T>(
        MaterialPageRoute<T>(
          builder: (_) => builder(_),
          settings: RouteSettings(name: name),
        ),
      );
}
