import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class UpgradeSeciton extends StatefulWidget {
  const UpgradeSeciton({super.key});

  @override
  State<UpgradeSeciton> createState() => _UpgradeSecitonState();
}

class _UpgradeSecitonState extends State<UpgradeSeciton> {
  PricingRecurrence recurrence = PricingRecurrence.monthly;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 50, right: 30, top: 30, bottom: 10),
      children: <Widget>[
        Text(
          AppString.allPlans,
          style: context.textTheme.titleMedium,
        ),
        const Divider(
          thickness: 0.5,
        ),
        const Height10(),
        Center(
          child: PricingRecurrenceSwitch(
            recurrence: recurrence,
            onSwitch: (PricingRecurrence value) {
              recurrence = value;
              setState(() {});
            },
          ),
        ),
        const Height10(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PricingCard(
              pricing: pricings[0],
              recurrence: recurrence,
              onSelected: (PricingViewModel pricing) {},
              showCurrentPlan: true,
              showUpgradeButton: true,
            ),
            const Width10(),
            PricingCard(
              pricing: pricings[1],
              recurrence: recurrence,
              onSelected: (PricingViewModel pricing) {},
              showCurrentPlan: true,
              showUpgradeButton: true,
            )
          ],
        ),
      ],
    );
  }
}
