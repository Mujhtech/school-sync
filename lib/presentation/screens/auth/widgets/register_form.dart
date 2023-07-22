import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/core.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstnameController =
      TextEditingController(text: '');
  late final TextEditingController _lastnameController =
      TextEditingController(text: '');
  late final TextEditingController _phoneNumberController =
      TextEditingController(text: '');
  late final TextEditingController _emailController =
      TextEditingController(text: '');

  late final TextEditingController _passwordController =
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
              Row(
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
              const Height10(),
              PrimaryTextFormField(
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
              PrimaryTextFormField.password(
                context: context,
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});

                  return isPasswordVisible;
                },
                isVisible: isPasswordVisible,
                controller: _passwordController,
              ),
              const Height10(),
              PrimaryButton(
                label: 'Register',
                loading: isLoading,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  try {
                    isLoading = true;
                    setState(() {});
                    final UserEntity? res =
                        await ref.read(authProvider).register(
                              AccountEntity(
                                email: _emailController.text.trim(),
                                firstName: _firstnameController.text.trim(),
                                lastName: _lastnameController.text.trim(),
                                phoneNumber: _phoneNumberController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );

                    if (res != null) {
                      // ignore: use_build_context_synchronously
                      await context.router.goToSelectSchool();
                    }
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
              const Height15(),
              InkWell(
                onTap: () => context.router.goToLogin(),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have account? ',
                    style: context.textTheme.bodySmall!.copyWith(fontSize: 10),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign in',
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
