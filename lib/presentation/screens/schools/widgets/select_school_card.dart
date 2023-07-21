import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class SelectSchoolCard extends StatelessWidget {
  const SelectSchoolCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.black,
        ),
        Text(
          'Al-Azau Primary School',
          style: context.textTheme.titleSmall,
        )
      ],
    );
  }
}
