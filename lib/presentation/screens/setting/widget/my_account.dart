import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstnameController =
      TextEditingController(text: '');
  late final TextEditingController _lastnameController =
      TextEditingController(text: '');
  late final TextEditingController _phoneNumberController =
      TextEditingController(text: '');
  late final TextEditingController _emailController =
      TextEditingController(text: '');

  bool isLoading = false;
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
                  AppString.manage,
                  style: context.textTheme.titleMedium,
                ),
                const Divider(
                  thickness: 0.5,
                ),
                const Height15(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: context.screenWidth(0.3),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: PrimaryTextFormField(
                              controller: _firstnameController,
                              hint: 'Firstname',
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
                              controller: _lastnameController,
                              hint: 'Lastname',
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
                    ),
                    const Height15(),
                    SizedBox(
                      width: context.screenWidth(0.3),
                      child: PrimaryTextFormField(
                        controller: _phoneNumberController,
                        hint: 'Phone Number',
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
                    const Height15(),
                    SizedBox(
                      width: context.screenWidth(0.3),
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
                const Height15(),
                ListTile(
                  mouseCursor: SystemMouseCursors.click,
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  title: Text(
                    'Log out of all devices',
                    style: context.textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    'Log out of all other active sessions on other devices besides this one',
                    style: context.textTheme.bodySmall,
                  ),
                  trailing: Icon(
                    TablerIcons.chevron_right,
                    size: 18,
                    color: context.textColorWithOpacity,
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
                )
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
                    onPressed: () => context.router.goBack(),
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
