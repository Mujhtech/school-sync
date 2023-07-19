import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter(this._context);

  final BuildContext _context;

  void pop() => Navigator.of(_context).pop();

  Future<T?> _goTo<T>(WidgetBuilder builder, String name) =>
      Navigator.of(_context).push<T>(
        MaterialPageRoute<T>(
          builder: (_) => builder(_),
          settings: RouteSettings(name: name),
        ),
      );
}
