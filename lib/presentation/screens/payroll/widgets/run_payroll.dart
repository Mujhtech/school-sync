import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class RunPayroll extends StatelessWidget {
  const RunPayroll({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoBanner(
      content: Row(
        children: <Widget>[
          Icon(
            TablerIcons.report_money,
            size: 50,
            color: context.textColorWithOpacity,
          ),
          const Width10(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Approve payroll: Aug 01-30',
                style: context.textTheme.titleMedium,
              ),
              const Height10(),
              Text(
                "Please approve payroll by 4:00pm on Tuesday August 20th to pay your staff for\ntheir hard work. Note they'l receive their fund by Friday 29th August.",
                style: context.textTheme.bodySmall,
              ),
              const Height10(),
              PrimaryButton(
                height: 40,
                width: 150,
                onPressed: () {},
                label: 'Approve payroll',
              )
            ],
          ),
        ],
      ),
    );
  }
}
