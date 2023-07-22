import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/core.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              const Height15(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Forgot Password',
                    style: context.textTheme.bodySmall!.copyWith(fontSize: 10),
                  ),
                ],
              ),
              const Height15(),
              PrimaryButton(
                label: 'Login',
                loading: isLoading,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  try {
                    isLoading = true;
                    setState(() {});
                    final UserEntity? res = await ref.read(authProvider).login(
                          AccountEntity(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          ),
                        );

                    if (res != null) {
                      // ignore: use_build_context_synchronously
                      await context.router.goToSelectSchool();
                    }
                  } catch (error, stackTrace) {
                    //
                    context.snackBar.error(error.toString());
                    AppLog.e(error, stackTrace);
                  } finally {
                    isLoading = false;
                    setState(() {});
                  }
                },
              ),
              const Height15(),
              InkWell(
                onTap: () => context.router.goToRegister(),
                child: RichText(
                  text: TextSpan(
                    text: "Don't have account? ",
                    style: context.textTheme.bodySmall!.copyWith(fontSize: 10),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up',
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
