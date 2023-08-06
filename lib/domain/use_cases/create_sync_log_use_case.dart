import 'package:school_sync/core.dart';
import 'package:school_sync/domain.dart';

class CreateSyncLogUseCase {
  const CreateSyncLogUseCase({
    required SyncLogsRepository syncLogsRepository,
  }) : _syncLogsRepository = syncLogsRepository;

  final SyncLogsRepository _syncLogsRepository;

  Future<String> call(CreateSyncLogData data) async {
    try {
      final ReferenceEntity ref = await _syncLogsRepository.create(data);

      return ref.id;
    } catch (error, stackTrace) {
      AppLog.e(error, stackTrace);
      rethrow;
    }
  }
}
