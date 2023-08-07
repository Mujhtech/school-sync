import 'package:school_sync/domain.dart';

abstract class ClassesRepository {
  Future<String> create(CreateClassData data);

  Future<bool> update(UpdateClassData data);

  Future<bool> delete(ReferenceEntity reference);

  Stream<ClassEntityList> fetchAll(String schoolId);

  Stream<ClassEntity> fetchOne(
    String schoolId,
    String id,
  );
}
