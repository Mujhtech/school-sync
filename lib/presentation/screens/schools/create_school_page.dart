import 'package:flutter/material.dart';

import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

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
      body: Column(
        children: <Widget>[
          Container(
            height: 30,
            decoration: BoxDecoration(color: context.cardColor),
            child: Row(
              children: <Widget>[
                CustomWidth(
                  width: context.screenWidth(0.1),
                ),
                GestureDetector(
                  onTap: () => context.router.goBack(),
                  child: CircleAvatar(
                    backgroundColor: context.backgroundColor,
                    radius: 20,
                    child: Icon(
                      TablerIcons.arrow_back,
                      size: 18,
                      color: context.iconColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomHeight(
            height: context.screenHeight(0.1),
          ),
          Center(
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
        ],
      ),
    );
  }
}
