import 'package:school_sync/domain.dart';

class CreateSessionUseCase {
  const CreateSessionUseCase({
    required SessionsRepository sessionsRepository,
  }) : _sessionsRepository = sessionsRepository;

  final SessionsRepository _sessionsRepository;

  Future<String> call(CreateSessionData data) =>
      _sessionsRepository.create(data);
}
