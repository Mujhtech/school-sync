import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class RunPayroll extends StatelessWidget {
  const RunPayroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: context.cardColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -50,
            right: 20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            right: 135,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: 200,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: 110,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -15,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: context.buttonColor,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
