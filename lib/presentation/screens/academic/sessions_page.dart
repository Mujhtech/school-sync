import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
      children: <Widget>[
        Text(
          AppString.sessions,
          style: context.textTheme.titleLarge,
        ),
        const Height15(),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '#',
                style: context.textTheme.titleSmall,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                AppString.year,
                style: context.textTheme.titleSmall,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                AppString.code,
                style: context.textTheme.titleSmall,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                AppString.action,
                style: context.textTheme.titleSmall,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
        ),
      ],
    );
  }
}
