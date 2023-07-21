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
            onPressed: () {
              context.router.goToSelectSchool();
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
