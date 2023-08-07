import 'package:school_sync/domain.dart';

abstract class SubjectsRepository {
  Future<String> create(CreateSubjectData data);

  Future<bool> update(UpdateSubjectData data);

  Future<bool> delete(ReferenceEntity reference);

  Stream<SubjectEntityList> fetchAll(String schoolId);

  Stream<SubjectEntity> fetchOne(
    String schoolId,
    String id,
  );
}
