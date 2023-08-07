import 'package:school_sync/domain.dart';

class FetchSubjectsUseCase {
  const FetchSubjectsUseCase({
    required SubjectsRepository subjectsRepository,
  }) : _subjectsRepository = subjectsRepository;

  final SubjectsRepository _subjectsRepository;

  Stream<SubjectEntityList> call(String schoolId) =>
      _subjectsRepository.fetchAll(schoolId);
}
