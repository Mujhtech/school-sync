import 'dart:io';

import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:meta/meta.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/domain/entities/create_school_data.dart';
import 'package:school_sync/domain/entities/school_entity.dart';
import 'package:school_sync/domain/entities/sync_log_entity.dart';
import 'package:school_sync/domain/entities/update_school_data.dart';
import 'package:uuid/uuid.dart';

part 'daos.dart';
part 'mappings.dart';
part 'tables.dart';
part 'database.g.dart';

@DriftDatabase(
  tables: <Type>[
    Users,
    SyncLogs,
    Schools,
  ],
  daos: <Type>[
    UsersDao,
    SyncLogsDao,
    SchoolsDao,
  ],
)
class Database extends _$Database {
  Database(String path)
      : super(
          LazyDatabase(
            () => NativeDatabase.createInBackground(
              File(path),
              logStatements: true,
            ),
          ),
        );

  Database.memory() : super(NativeDatabase.memory(logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (OpeningDetails details) async =>
            customStatement('PRAGMA foreign_keys = ON'),
        onCreate: (Migrator m) async => m.createAll(),
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await Future.wait(<Future<void>>[
              // m.createTable(budgetMetadataKeys),
              // m.createTable(budgetMetadataValues),
              // m.createTable(budgetMetadataAssociations),
            ]);
          }
        },
      );
}
