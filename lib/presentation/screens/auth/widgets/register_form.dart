import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const Width5(),
              Expanded(
                child: PrimaryTextFormField(
                  controller: _lastnameController,
                  hint: 'Lastname',
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
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
          ),
          const Height10(),
          PrimaryTextFormField(
            controller: _emailController,
            hint: 'Email',
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
            onPressed: () {
              context.router.goToSelectSchool();
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
                    style: context.textTheme.bodySmall!
                        .copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
