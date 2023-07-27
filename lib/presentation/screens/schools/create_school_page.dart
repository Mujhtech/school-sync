import 'package:flutter/material.dart';

import 'package:school_sync/presentation.dart';

import 'widgets/create_school_form.dart';

class CreateSchoolPage extends StatefulWidget {
  const CreateSchoolPage({super.key});

  @override
  State<CreateSchoolPage> createState() => _CreateSchoolPageState();
}

class _CreateSchoolPageState extends State<CreateSchoolPage> {
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
          child: const CreateSchoolForm(),
        ),
      ),
    );
  }
}
