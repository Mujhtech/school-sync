import 'package:school_sync/domain/entities/school_entity.dart';
import 'package:school_sync/domain/repositories/schools.dart';

class FetchSchoolUseCase {
  const FetchSchoolUseCase({
    required SchoolsRepository schools,
  }) : _schools = schools;

  final SchoolsRepository _schools;

  Future<SchoolEntity?> call(String id) => _schools.getSingleOrNull(id);
}
