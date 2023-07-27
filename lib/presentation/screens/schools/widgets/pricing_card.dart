import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({
    super.key,
    required this.pricing,
    required this.recurrence,
    required this.onSelected,
  });
  final PricingViewModel pricing;
  final PricingRecurrence recurrence;
  final void Function(PricingViewModel) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected.call(pricing),
      child: Container(
        constraints: BoxConstraints(
          minHeight: context.screenHeight(0.7) * 0.3,
          maxHeight: context.screenHeight(0.7) * 0.8,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: pricing.isRecommended ? 0 : 10,
          vertical: pricing.isRecommended ? 0 : 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.iconColor!,
            width: pricing.isRecommended ? 3 : 1,
          ),
          borderRadius: AppBorderRadius.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (pricing.isRecommended)
              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 5),
                color: context.iconColor,
                child: Center(
                  child: Text(
                    'Recommended',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.buttonTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: !pricing.isRecommended ? 0 : 10,
                vertical: !pricing.isRecommended ? 0 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pricing.label,
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    pricing.description,
                    style: context.textTheme.bodySmall!.copyWith(fontSize: 10),
                  ),
                  SizedBox(
                    width: 220,
                    child: Divider(
                      color: context.iconColor!.withOpacity(0.1),
                      thickness: 1,
                    ),
                  ),
                  const Height20(),
                  RichText(
                    text: TextSpan(
                      text: '#${pricing.price * recurrence.months}',
                      style: context.textTheme.titleLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              ' / ${recurrence.name.replaceAll('ly', '')} / school',
                          style: context.textTheme.bodySmall!
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  const Height20(),
                  SizedBox(
                    width: 220,
                    child: Divider(
                      color: context.iconColor!.withOpacity(0.1),
                      thickness: 1,
                    ),
                  ),
                  Text(
                    'With: ',
                    style: context.textTheme.bodySmall,
                  ),
                  const Height3(),
                  Row(
                    children: <Widget>[
                      const Icon(
                        TablerIcons.check,
                        color: Colors.green,
                        size: 12,
                      ),
                      const Width5(),
                      Text(
                        'Cloud sync',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Height3(),
                  Row(
                    children: <Widget>[
                      const Icon(
                        TablerIcons.check,
                        color: Colors.green,
                        size: 12,
                      ),
                      const Width5(),
                      Text(
                        'Report generate',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Height3(),
                  Row(
                    children: <Widget>[
                      const Icon(
                        TablerIcons.check,
                        color: Colors.green,
                        size: 12,
                      ),
                      const Width5(),
                      Text(
                        'Automate payroll',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Height3(),
                  Row(
                    children: <Widget>[
                      const Icon(
                        TablerIcons.check,
                        color: Colors.green,
                        size: 12,
                      ),
                      const Width5(),
                      Text(
                        'Grade system',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Height3(),
                  ...pricing.listOfItemsInPackage.map(
                    (String e) => Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(
                              TablerIcons.check,
                              color: Colors.green,
                              size: 12,
                            ),
                            const Width5(),
                            Text(
                              e,
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const Height3(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PricingViewModel> pricings = <PricingViewModel>[
  PricingViewModel(
    id: 'id',
    label: 'Pro',
    description: 'For school with <= 5000 students',
    price: 10000,
    listOfItemsInPackage: <String>[],
  ),
  PricingViewModel(
    id: 'id',
    label: 'Premium',
    description: 'For school with > 5000 students',
    price: 25000,
    isRecommended: true,
    listOfItemsInPackage: <String>[],
  )
];

class PricingViewModel {
  PricingViewModel({
    required this.id,
    required this.label,
    required this.description,
    required this.price,
    this.isRecommended = false,
    required this.listOfItemsInPackage,
  });

  final String id;
  final String label;
  final String description;
  final double price;
  final bool isRecommended;
  final List<String> listOfItemsInPackage;
}
