import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/core.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

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

  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                    // final UserEntity? res =
                    //     await ref.read(authProvider).register(
                    //           AccountEntity(
                    //             email: _emailController.text.trim(),
                    //             firstName: _addressController.text.trim(),
                    //             lastName: _shortnameController.text.trim(),
                    //             phoneNumber: _phoneNumberController.text.trim(),
                    //             password: _passwordController.text.trim(),
                    //           ),
                    //         );

                    // if (res != null) {
                    //   // ignore: use_build_context_synchronously
                    //   await context.router.goToSelectSchool();
                    // }
                  } catch (error, stackTrace) {
                    //
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
        );
      },
    );
  }
}
