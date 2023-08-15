import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class StudentEnrollmentBanner extends StatelessWidget {
  const StudentEnrollmentBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoBanner(
      content: Row(
        children: <Widget>[
          Icon(
            TablerIcons.question_mark,
            size: 50,
            color: context.iconColor,
          ),
          const Width10(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Do you know that?',
                style: context.textTheme.titleLarge,
              ),
              const Height10(),
              Text(
                'You can automate student enrollment using\nSchool Sync Form builder.',
                style: context.textTheme.bodySmall,
              ),
              const Height10(),
              PrimaryButton(
                height: 40,
                width: 150,
                onPressed: () {},
                label: AppString.getStarted,
              )
            ],
          )
        ],
      ),
    );
  }
}
