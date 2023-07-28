import 'package:school_sync/domain.dart';

class FetchCurrentSchoolIdUseCase {
  const FetchCurrentSchoolIdUseCase({
    required CurrentSchoolIdRepository currentSchool,
  }) : _currentSchool = currentSchool;

  final CurrentSchoolIdRepository _currentSchool;

  Future<String?> call() async => _currentSchool.getId();
}
