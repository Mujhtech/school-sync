import 'package:school_sync/domain.dart';

class FetchClassesUseCase {
  const FetchClassesUseCase({
    required ClassesRepository classesRepository,
  }) : _classesRepository = classesRepository;

  final ClassesRepository _classesRepository;

  Stream<ClassEntityList> call(String schoolId) =>
      _classesRepository.fetchAll(schoolId);
}
