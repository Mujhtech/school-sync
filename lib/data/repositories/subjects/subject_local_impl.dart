import 'package:school_sync/data.dart';
import 'package:school_sync/domain.dart';

class SubjectsLocalImpl implements SubjectsRepository {
  const SubjectsLocalImpl(this._db);

  final Database _db;

  @override
  Future<String> create(CreateSubjectData data) =>
      _db.subjectsDao.createSubject(data);

  @override
  Future<bool> delete(ReferenceEntity reference) =>
      _db.subjectsDao.deleteSubject(reference.id);

  @override
  Stream<SubjectEntityList> fetchAll(String schoolId) =>
      _db.subjectsDao.watchAll(schoolId);

  @override
  Stream<SubjectEntity> fetchOne(String schoolId, String id) =>
      _db.subjectsDao.watchSingle(schoolId, id);

  @override
  Future<bool> update(UpdateSubjectData data) =>
      _db.subjectsDao.updateSubject(data);
}
