import 'package:flutter/material.dart';

import 'package:school_sync/presentation.dart';

import 'widgets/create_school_form.dart';
import 'widgets/pricing_card.dart';

class CreateSchoolPage extends StatefulWidget {
  const CreateSchoolPage({super.key});

  @override
  State<CreateSchoolPage> createState() => _CreateSchoolPageState();
}

class _CreateSchoolPageState extends State<CreateSchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.screenHeight(0.7),
          width: context.screenWidth(0.8),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: AppBorderRadius.xl,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: context.screenWidth(0.8) * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Get started',
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        'Fill all information below to continue',
                        style: context.textTheme.bodySmall,
                      ),
                      const Height15(),
                      const CreateSchoolForm()
                    ],
                  ),
                ),
              ),
              const Width15(),
              Expanded(
                child: Column(
                  children: <Widget>[
                    CustomHeight(
                      height: context.screenHeight(0.03),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 240),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7.0,
                                  horizontal: 26,
                                ),
                                child: Text(
                                  'Monthly',
                                  style: context.textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7.0,
                                  horizontal: 26,
                                ),
                                child: Text(
                                  'Annually',
                                  style: context.textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Height10(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        PricingCard(
                          pricing: pricings[0],
                        ),
                        const Width10(),
                        PricingCard(
                          pricing: pricings[1],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
