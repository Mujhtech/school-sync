import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class PayrollReport extends StatelessWidget {
  const PayrollReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 5,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Container(
          width: context.screenWidth(0.18),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    TablerIcons.report_money,
                    size: 18,
                    color: context.textColorWithOpacity,
                  ),
                  Text(
                    'Last month',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.textColorWithOpacity,
                    ),
                  )
                ],
              ),
              const Height10(),
              Text('12', style: context.textTheme.titleLarge),
              const Height10(),
              Text(
                'Total payroll paid',
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.textColorWithOpacity),
              )
            ],
          ),
        ),
        Container(
          width: context.screenWidth(0.18),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    TablerIcons.report_money,
                    size: 18,
                    color: context.textColorWithOpacity,
                  ),
                  Text(
                    'Last month',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.textColorWithOpacity,
                    ),
                  )
                ],
              ),
              const Height10(),
              Text('12', style: context.textTheme.titleLarge),
              const Height10(),
              Text(
                'Total payroll paid',
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.textColorWithOpacity),
              )
            ],
          ),
        ),
        Container(
          width: context.screenWidth(0.18),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    TablerIcons.report_money,
                    size: 18,
                    color: context.textColorWithOpacity,
                  ),
                  Text(
                    'Last month',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.textColorWithOpacity,
                    ),
                  )
                ],
              ),
              const Height10(),
              Text('12', style: context.textTheme.titleLarge),
              const Height10(),
              Text(
                'Total payroll paid',
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.textColorWithOpacity),
              )
            ],
          ),
        ),
        Container(
          width: context.screenWidth(0.18),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    TablerIcons.report_money,
                    size: 18,
                    color: context.textColorWithOpacity,
                  ),
                  Text(
                    'Last month',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.textColorWithOpacity,
                    ),
                  )
                ],
              ),
              const Height10(),
              Text('12', style: context.textTheme.titleLarge),
              const Height10(),
              Text(
                'Total payroll paid',
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.textColorWithOpacity),
              )
            ],
          ),
        )
      ],
    );
  }
}
