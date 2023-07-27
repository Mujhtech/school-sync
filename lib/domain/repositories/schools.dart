import 'package:school_sync/domain/entities/create_school_data.dart';
import 'package:school_sync/domain/entities/school_entity.dart';
import 'package:school_sync/domain/entities/update_school_data.dart';

import '../entities/reference_entity.dart';

abstract class SchoolsRepository {
  Future<ReferenceEntity> create(CreateSchoolData school);

  Future<bool> update(UpdateSchooData school);

  Future<bool> delete(ReferenceEntity reference);

  Stream<SchoolEntityList> fetchAll(String userId);

  Stream<SchoolEntity> fetchOne({
    required String userId,
    required String schoolId,
  });
}
