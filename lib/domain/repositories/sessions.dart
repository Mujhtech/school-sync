import 'package:school_sync/domain.dart';

abstract class SessionsRepository {
  Future<String> create(CreateSessionData data);

  Future<bool> update(UpdateSessionData data);

  Future<bool> delete(ReferenceEntity reference);

  Stream<SessionEntityList> fetchAll(String schoolId);

  Stream<SessionEntity> fetchOne(
    String schoolId,
    String id,
  );
}
