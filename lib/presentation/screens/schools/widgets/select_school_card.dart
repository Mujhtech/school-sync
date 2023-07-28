import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class SelectSchoolCard extends StatelessWidget {
  const SelectSchoolCard({
    super.key,
    required this.school,
    required this.onClicked,
  });
  final SchoolViewModel school;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
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
          Container(
            constraints: BoxConstraints(maxWidth: context.screenWidth(0.1)),
            child: Text(
              school.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: context.textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}
