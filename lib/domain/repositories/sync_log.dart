import 'package:school_sync/domain.dart';

import '../entities/sync_log_entity.dart';

abstract class SyncLogsRepository {
  Future<ReferenceEntity> create(CreateSyncLogData school);

  Future<bool> delete(ReferenceEntity reference);

  Stream<SyncLogEntityList> fetchAll(String schoolId);

  Future<int> getCount(
    String schoolId,
  );
}
