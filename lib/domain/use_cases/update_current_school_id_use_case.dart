import 'package:school_sync/domain.dart';

class UpdateCurrentSchoolIdUseCase {
  const UpdateCurrentSchoolIdUseCase({
    required CurrentSchoolIdRepository currentSchool,
  }) : _currentSchool = currentSchool;

  final CurrentSchoolIdRepository _currentSchool;

  Future<bool> call(String value) async => _currentSchool.changeId(value);
}
