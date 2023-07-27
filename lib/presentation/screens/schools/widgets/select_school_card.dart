import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

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
            child: Icon(
              TablerIcons.photo_off,
              size: 30,
              color: context.iconColor,
            ),
          ),
          Expanded(
            child: Text(
              school.name,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}
