import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/core.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/states/user_provider.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'pricing_card.dart';
import 'pricing_type_switch.dart';

class CreateSchoolForm extends StatefulWidget {
  const CreateSchoolForm({super.key});

  @override
  State<CreateSchoolForm> createState() => _CreateSchoolFormState();
}

class _CreateSchoolFormState extends State<CreateSchoolForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController =
      TextEditingController(text: '');
  late final TextEditingController _shortnameController =
      TextEditingController(text: '');
  late final TextEditingController _addressController =
      TextEditingController(text: '');
  late final TextEditingController _emailController =
      TextEditingController(text: '');
  SchoolType schoolType = SchoolType.basic;
  PricingRecurrence recurrence = PricingRecurrence.monthly;

  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        return Row(
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const Height20(),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                context.iconColor!.withOpacity(0.1),
                            child: Icon(
                              TablerIcons.upload,
                              size: 25,
                              color: context.iconColor,
                            ),
                          ),
                          const Height10(),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: PrimaryTextFormField(
                                  controller: _nameController,
                                  hint: 'Name',
                                  validator: (String? p0) {
                                    if (p0 == null || p0.isEmpty) {
                                      return 'Field is required';
                                    }
                                    return null;
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              const Width5(),
                              Expanded(
                                child: PrimaryTextFormField(
                                  controller: _shortnameController,
                                  hint: 'Short name (Optional)',
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ],
                          ),
                          const Height10(),
                          PrimaryTextFormField(
                            controller: _addressController,
                            hint: 'Address',
                            validator: (String? p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                          ),
                          const Height10(),
                          PrimaryTextFormField(
                            controller: _emailController,
                            hint: 'Email',
                            validator: (String? p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                          ),
                          const Height10(),
                          Row(
                            children: <Widget>[
                              ...SchoolType.values
                                  .map(
                                    (SchoolType type) => GestureDetector(
                                      onTap: () {
                                        schoolType = type;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Radio<SchoolType>(
                                            value: type,
                                            groupValue: schoolType,
                                            onChanged: (SchoolType? value) {
                                              if (value != null) {
                                                schoolType = value;
                                                setState(() {});
                                              }
                                            },
                                          ),
                                          Text(
                                            '${type.name.toUpperCase()} SCHOOL',
                                            style: context.textTheme.bodySmall,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                          const Height10(),
                          PrimaryButton(
                            label: 'Continue',
                            loading: isLoading,
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              try {
                                isLoading = true;
                                setState(() {});

                                final UserEntity user =
                                    await ref.watch(userProvider.future);

                                final String schoolId = await ref
                                    .read(schoolProvider)
                                    .create(
                                      CreateSchoolData(
                                        name: _nameController.text.trim(),
                                        acronyms:
                                            _shortnameController.text.trim(),
                                        address: _addressController.text.trim(),
                                        logo: null,
                                        email: _emailController.text.trim(),
                                        latitude: null,
                                        longitude: null,
                                        schoolType: schoolType.name,
                                        id: null,
                                        userId: user.id,
                                      ),
                                    );

                                // ignore: use_build_context_synchronously
                                await context.router.goToSetupSchool(schoolId);
                              } catch (error, stackTrace) {
                                context.snackBar.error(
                                  error.toString(),
                                );
                                AppLog.e(error, stackTrace);
                              } finally {
                                isLoading = false;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                    ),
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
                  PricingRecurrenceSwitch(
                    recurrence: recurrence,
                    onSwitch: (PricingRecurrence value) {
                      recurrence = value;
                      setState(() {});
                    },
                  ),
                  const Height10(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      PricingCard(
                        pricing: pricings[0],
                        recurrence: recurrence,
                        onSelected: (PricingViewModel pricing) {},
                      ),
                      const Width10(),
                      PricingCard(
                        pricing: pricings[1],
                        recurrence: recurrence,
                        onSelected: (PricingViewModel pricing) {},
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
