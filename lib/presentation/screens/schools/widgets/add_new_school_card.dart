import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class AddNewSchoolCard extends StatelessWidget {
  const AddNewSchoolCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundColor: context.theme.cardColor,
          child: const Icon(
            TablerIcons.plus,
            size: 30,
            color: Colors.white,
          ),
        ),
        Text(
          'Add new',
          style: context.textTheme.titleSmall,
        )
      ],
    );
  }
}
