import 'package:flutter/material.dart';
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
          PrimaryTextFormField(
            controller: _passwordController,
            hint: 'Password',
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
          ),
          const Height10(),
          PrimaryButton(label: 'Login', onPressed: () {})
        ],
      ),
    );
  }
}
