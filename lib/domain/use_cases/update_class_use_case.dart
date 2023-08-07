import 'package:school_sync/domain.dart';

class UpdateClassUseCase {
  const UpdateClassUseCase({
    required ClassesRepository classesRepository,
  }) : _classesRepository = classesRepository;

  final ClassesRepository _classesRepository;

  Future<bool> call(UpdateClassData data) => _classesRepository.update(data);
}
