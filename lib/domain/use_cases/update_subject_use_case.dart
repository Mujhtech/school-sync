import 'package:school_sync/domain.dart';

class UpdateSubjectUseCase {
  const UpdateSubjectUseCase({
    required SubjectsRepository subjectsRepository,
  }) : _subjectsRepository = subjectsRepository;

  final SubjectsRepository _subjectsRepository;

  Future<bool> call(UpdateSubjectData data) => _subjectsRepository.update(data);
}
