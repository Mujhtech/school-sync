import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView(
            padding:
                const EdgeInsets.only(left: 50, right: 30, top: 30, bottom: 10),
            children: <Widget>[
              Text(
                AppString.security,
                style: context.textTheme.titleMedium,
              ),
              const Divider(
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
