import 'package:school_sync/domain.dart';

class UpdateSessionUseCase {
  const UpdateSessionUseCase({
    required SessionsRepository sessionsRepository,
  }) : _sessionsRepository = sessionsRepository;

  final SessionsRepository _sessionsRepository;

  Future<bool> call(UpdateSessionData data) => _sessionsRepository.update(data);
}
