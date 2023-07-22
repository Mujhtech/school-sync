import 'package:school_sync/domain.dart';
import 'package:school_sync/domain/entities/create_school_data.dart';
import 'package:school_sync/domain/entities/school_entity.dart';
import 'package:school_sync/domain/entities/update_school_data.dart';

import '../../local_database.dart';

class SchoolsLocalImpl implements SchoolsRepository {
  const SchoolsLocalImpl(this._db);

  final Database _db;

  @override
  Future<ReferenceEntity> create(String userId, CreateSchooData school) =>
      _db.schoolsDao.createSchool(school).then((_) => (id: _.id, path: _.path));

  @override
  Future<bool> delete(ReferenceEntity reference) =>
      _db.schoolsDao.deleteSchool(reference.id);

  @override
  Stream<SchoolEntityList> fetchAll(String userId) =>
      _db.schoolsDao.watchAll(userId);

  @override
  Stream<SchoolEntity> fetchOne({
    required String schoolId,
    required String userId,
  }) =>
      _db.schoolsDao.watchSingle(schoolId);

  @override
  Future<bool> update(UpdateSchooData budget) =>
      _db.schoolsDao.updateSchool(budget);
}
