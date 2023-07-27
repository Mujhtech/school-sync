import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class SetupSchoolPage extends StatelessWidget {
  const SetupSchoolPage({super.key, required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.screenHeight(0.7),
          width: context.screenWidth(0.8),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: AppBorderRadius.xl,
          ),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
