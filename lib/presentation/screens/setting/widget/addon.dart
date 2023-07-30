import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class AddonSection extends StatelessWidget {
  const AddonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 50, right: 30, top: 30, bottom: 10),
      children: <Widget>[
        Text(
          AppString.addon,
          style: context.textTheme.titleMedium,
        ),
        const Divider(
          thickness: 0.5,
        ),
      ],
    );
  }
}
