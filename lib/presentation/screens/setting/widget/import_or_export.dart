import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class ImportOrExportSection extends StatelessWidget {
  const ImportOrExportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 50, right: 30, top: 30, bottom: 10),
      children: <Widget>[
        Text(
          AppString.importDb,
          style: context.textTheme.titleMedium,
        ),
        const Divider(
          thickness: 0.5,
        ),
        Text(
          'Restore database with one-click',
          style: context.textTheme.bodySmall!.copyWith(),
        ),
        const Height15(),
        Text(
          AppString.exportDb,
          style: context.textTheme.titleMedium,
        ),
        const Divider(
          thickness: 0.5,
        ),
        Text(
          'Backup your database and share it to anywhere',
          style: context.textTheme.bodySmall!.copyWith(),
        ),
        const Height15(),
      ],
    );
  }
}
