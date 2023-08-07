import 'package:school_sync/domain.dart';

class CreateClassUseCase {
  const CreateClassUseCase({
    required ClassesRepository classesRepository,
  }) : _classesRepository = classesRepository;

  final ClassesRepository _classesRepository;

  Future<String> call(CreateClassData data) => _classesRepository.create(data);
}
