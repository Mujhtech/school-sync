import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/auth/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 260,
            maxHeight: 450,
          ),
          width: context.screenWidth(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppString.hi,
                style: context.textTheme.titleSmall,
              ),
              const Height10(),
              Text(
                'Login to continue',
                style: context.textTheme.titleMedium,
              ),
              const Height20(),
              const LoginForm(),
              const Height20(),
              const Height20(),
              Center(
                child: Text(
                  AppString.appCopyright,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
