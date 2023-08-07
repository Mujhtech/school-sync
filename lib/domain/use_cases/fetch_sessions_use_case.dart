import 'package:school_sync/domain.dart';

class FetchSessionsUseCase {
  const FetchSessionsUseCase({
    required SessionsRepository sessionsRepository,
  }) : _sessionsRepository = sessionsRepository;

  final SessionsRepository _sessionsRepository;

  Stream<SessionEntityList> call(String schoolId) =>
      _sessionsRepository.fetchAll(schoolId);
}
