import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class PricingRecurrenceSwitch extends StatelessWidget {
  const PricingRecurrenceSwitch({
    super.key,
    required this.recurrence,
    required this.onSwitch,
  });

  final PricingRecurrence recurrence;
  final void Function(PricingRecurrence) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 260),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.buttonColor.withOpacity(0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => onSwitch(PricingRecurrence.monthly),
            child: Container(
              decoration: BoxDecoration(
                color: recurrence == PricingRecurrence.monthly
                    ? context.buttonColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7.0,
                  horizontal: 16,
                ),
                child: Text(
                  'Monthly',
                  style: context.textTheme.titleSmall!.copyWith(
                    color: recurrence == PricingRecurrence.monthly
                        ? context.buttonTextColor
                        : context.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const Width3(),
          GestureDetector(
            onTap: () => onSwitch(PricingRecurrence.yearly),
            child: Container(
              decoration: BoxDecoration(
                color: recurrence == PricingRecurrence.yearly
                    ? context.buttonColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7.0,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Yearly',
                      style: context.textTheme.titleSmall!.copyWith(
                        color: recurrence == PricingRecurrence.yearly
                            ? context.buttonTextColor
                            : context.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Width3(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 3,
                      ),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Save 10%',
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
