import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class SettingSection extends StatefulWidget {
  const SettingSection({super.key});

  @override
  State<SettingSection> createState() => _SettingSectionState();
}

class _SettingSectionState extends State<SettingSection> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final GlobalKey<FormFieldState<ThemeMode>> _appearanceFieldKey =
      GlobalKey(debugLabel: 'appearanceFieldKey');

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                left: 50,
                right: 30,
                top: 30,
                bottom: 10,
              ),
              children: <Widget>[
                Text(
                  AppString.setting,
                  style: context.textTheme.titleMedium,
                ),
                const Divider(
                  thickness: 0.5,
                ),
                const Height15(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PrimaryTextFormField(
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
                    const Height3(),
                    Text(
                      'School name',
                      style: context.textTheme.bodySmall,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const Height20(),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: context.iconColor!.withOpacity(0.1),
                      child: Icon(
                        TablerIcons.upload,
                        size: 25,
                        color: context.iconColor,
                      ),
                    ),
                    const Height10(),
                    Text(
                      'Upload school logo',
                      style: context.textTheme.bodySmall,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const Height20(),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: PrimaryTextFormField(
                            controller: _shortnameController,
                            hint: 'Short name (Optional)',
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const Width5(),
                        Expanded(
                          child: PrimaryTextFormField(
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      title: Text(
                        'Appearance',
                        style: context.textTheme.titleSmall,
                      ),
                      subtitle: Text(
                        'Customize how School Sync looks on your device',
                        style: context.textTheme.bodySmall,
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Consumer(
                          builder: (BuildContext context, WidgetRef ref, _) {
                            return DropdownButtonFormField<ThemeMode>(
                              key: _appearanceFieldKey,
                              value: ref.watch(
                                preferencesProvider
                                    .select((_) => _.value?.themeMode),
                              ),
                              icon: Icon(
                                TablerIcons.chevron_down,
                                size: 18,
                                color: context.textColorWithOpacity,
                              ),
                              isExpanded: true,
                              decoration: const InputDecoration(
                                constraints: BoxConstraints(
                                  maxHeight: 35,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                // prefixIcon: Icon(AppIcons.metadata),
                              ),
                              hint: Text(
                                'Appearance',
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodySmall,
                              ),
                              items: <DropdownMenuItem<ThemeMode>>[
                                for (final ThemeMode item in ThemeMode.values)
                                  DropdownMenuItem<ThemeMode>(
                                    key: Key(item.index.toString()),
                                    value: item,
                                    child: Text(
                                      item.name.capitalize(),
                                      style: context.textTheme.bodySmall,
                                    ),
                                  ),
                              ],
                              onChanged: (ThemeMode? value) {
                                ref
                                    .read(preferencesProvider.notifier)
                                    .updateThemeMode(value!);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      title: Text(
                        'Delete account',
                        style: context.textTheme.titleSmall!
                            .copyWith(color: Colors.redAccent),
                      ),
                      subtitle: Text(
                        'Permanently delete the account and remove access from all schools.',
                        style: context.textTheme.bodySmall,
                      ),
                      trailing: Icon(
                        TablerIcons.chevron_right,
                        size: 18,
                        color: context.textColorWithOpacity,
                      ),
                    ),
                    const Height30(),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const Height20(),
                    Text(
                      'Danger zone',
                      style: context.textTheme.titleSmall,
                    ),
                    const Height10(),
                    SizedBox(
                      width: context.screenWidth(0.2),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: PrimaryButton(
                              height: 40,
                              onPressed: () {},
                              buttonColor: Colors.transparent,
                              borderColor: context.buttonColor,
                              textColor: context.textColor,
                              label: 'Leave school',
                            ),
                          ),
                          const Width15(),
                          Expanded(
                            child: PrimaryButton(
                              height: 40,
                              onPressed: () {},
                              label: 'Delete school',
                              buttonColor: Colors.transparent,
                              borderColor: Colors.redAccent,
                              textColor: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          const Height10(),
          Container(
            width: context.screenWidth(0.2),
            padding: const EdgeInsets.only(
              left: 50,
              right: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: PrimaryButton(
                    height: 40,
                    onPressed: () {},
                    label: 'Save',
                  ),
                ),
                const Width15(),
                Expanded(
                  child: PrimaryButton(
                    height: 40,
                    onPressed: () {},
                    label: 'Cancel',
                    buttonColor: Colors.transparent,
                    borderColor: context.buttonColor,
                    textColor: context.textColor,
                  ),
                ),
              ],
            ),
          ),
          const Height10(),
        ],
      ),
    );
  }
}
