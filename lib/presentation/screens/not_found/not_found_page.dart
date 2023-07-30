import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          TablerIcons.error_404,
          size: 150,
        ),
        Text(
          AppString.nothingToSeeHere,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall,
        )
      ],
    );
  }
}
