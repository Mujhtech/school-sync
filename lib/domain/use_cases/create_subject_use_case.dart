import 'package:school_sync/domain.dart';

class CreateSubjectUseCase {
  const CreateSubjectUseCase({
    required SubjectsRepository subjectsRepository,
  }) : _subjectsRepository = subjectsRepository;

  final SubjectsRepository _subjectsRepository;

  Future<String> call(CreateSubjectData data) =>
      _subjectsRepository.create(data);
}
