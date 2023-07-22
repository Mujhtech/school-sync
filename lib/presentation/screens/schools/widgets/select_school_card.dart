import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class SelectSchoolCard extends StatelessWidget {
  const SelectSchoolCard({super.key, required this.school});
  final SchoolViewModel school;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.goToDashboard();
      },
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundColor: context.theme.cardColor,
          ),
          Text(
            school.name,
            style: context.textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
