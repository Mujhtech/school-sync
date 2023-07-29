import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/schools/setup_school_page.dart';

import 'app_routes.dart';

class AppRouter {
  const AppRouter(this._context);

  final BuildContext _context;

  void goBack() => Navigator.of(_context).pop();

  Future<void> goToCreateSchool() =>
      _goTo((_) => const CreateSchoolPage(), AppRoutes.createSchool);

  Future<void> goToDashboard() =>
      _goTo((_) => const DashboardPage(), AppRoutes.dashboard);

  Future<void> goToRegister() =>
      _goTo((_) => const RegisterPage(), AppRoutes.register);

  Future<void> goToLogin() => _goTo((_) => const LoginPage(), AppRoutes.login);

  Future<void> goToSelectSchool() =>
      _goTo((_) => const SelectSchoolPage(), AppRoutes.selectSchool);

  Future<void> goToSetupSchool(String schoolId) => _goTo(
        (_) => SetupSchoolPage(
          schoolId: schoolId,
        ),
        AppRoutes.selectSchool,
      );

  Future<T?> _goTo<T>(WidgetBuilder builder, String name) =>
      Navigator.of(_context).push<T>(
        MaterialPageRoute<T>(
          builder: (_) => builder(_),
          settings: RouteSettings(name: name),
        ),
      );
}
