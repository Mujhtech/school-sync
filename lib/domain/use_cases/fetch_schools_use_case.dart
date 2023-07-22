import 'package:school_sync/domain/entities/school_entity.dart';
import 'package:school_sync/domain/repositories/schools.dart';

class FetchSchoolsUseCase {
  const FetchSchoolsUseCase({
    required SchoolsRepository schools,
  }) : _schools = schools;

  final SchoolsRepository _schools;

  Stream<SchoolEntityList> call(String userId) => _schools.fetchAll(userId);
}
