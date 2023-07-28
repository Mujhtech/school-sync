import 'package:school_sync/domain.dart';

import '../../local_database.dart';

class SchoolsLocalImpl implements SchoolsRepository {
  const SchoolsLocalImpl(this._db);

  final Database _db;

  @override
  Future<ReferenceEntity> create(CreateSchoolData school) =>
      _db.schoolsDao.createSchool(school).then((_) => (id: _.id, path: _.path));

  @override
  Future<bool> delete(ReferenceEntity reference) =>
      _db.schoolsDao.deleteSchool(reference.id);

  @override
  Stream<SchoolEntityList> fetchAll(String userId) =>
      _db.schoolsDao.watchAll(userId);

  @override
  Stream<SchoolEntity> fetchOne(
    String schoolId,
  ) =>
      _db.schoolsDao.watchSingle(schoolId);

  @override
  Future<bool> update(UpdateSchooData budget) =>
      _db.schoolsDao.updateSchool(budget);

  @override
  Future<SchoolEntity?> getSingleOrNull(String schoolId) =>
      _db.schoolsDao.getSingle(schoolId);
}
