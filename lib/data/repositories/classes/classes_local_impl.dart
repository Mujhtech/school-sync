import 'package:school_sync/data.dart';
import 'package:school_sync/domain.dart';

class ClassesLocalImpl implements ClassesRepository {
  const ClassesLocalImpl(this._db);

  final Database _db;

  @override
  Future<String> create(CreateClassData data) =>
      _db.classesDao.createClass(data);

  @override
  Future<bool> delete(ReferenceEntity reference) =>
      _db.classesDao.deleteClass(reference.id);

  @override
  Stream<ClassEntityList> fetchAll(String schoolId) =>
      _db.classesDao.watchAll(schoolId);

  @override
  Stream<ClassEntity> fetchOne(String schoolId, String id) =>
      _db.classesDao.watchSingle(schoolId, id);

  @override
  Future<bool> update(UpdateClassData data) => _db.classesDao.updateClass(data);
}
