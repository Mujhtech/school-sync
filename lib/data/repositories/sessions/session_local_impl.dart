import 'package:school_sync/data.dart';
import 'package:school_sync/domain.dart';

class SessionsLocalImpl implements SessionsRepository {
  const SessionsLocalImpl(this._db);

  final Database _db;

  @override
  Future<String> create(CreateSessionData data) =>
      _db.sessionsDao.createSession(data);
  @override
  Future<bool> delete(ReferenceEntity reference) =>
      _db.sessionsDao.deleteSession(reference.id);

  @override
  Stream<SessionEntityList> fetchAll(String schoolId) =>
      _db.sessionsDao.watchAll(schoolId);

  @override
  Stream<SessionEntity> fetchOne(String schoolId, String id) =>
      _db.sessionsDao.watchSingle(schoolId, id);

  @override
  Future<bool> update(UpdateSessionData data) =>
      _db.sessionsDao.updateSession(data);
}
