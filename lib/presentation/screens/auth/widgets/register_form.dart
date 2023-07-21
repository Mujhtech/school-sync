import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            label: 'Login',
            onPressed: () {
              context.router.goToSelectSchool();
            },
          )
        ],
      ),
    );
  }
}
