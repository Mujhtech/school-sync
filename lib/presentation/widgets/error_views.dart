import 'package:flutter/material.dart';
import 'package:school_sync/core.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.error, this.stackTrace, {super.key});

  static const Key errorViewKey = Key('errorViewKey');

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    AppLog.e(error, stackTrace ?? StackTrace.current);
    return Center(
      key: errorViewKey,
      child: Text(error.toString()),
    );
  }
}
