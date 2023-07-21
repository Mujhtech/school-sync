import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/auth/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 260,
            maxHeight: 550,
          ),
          width: context.screenWidth(0.35),
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
                'Create account',
                style: context.textTheme.titleMedium,
              ),
              const Height10(),
              const RegisterForm(),
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
