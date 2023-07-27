import 'package:school_sync/core.dart';
import 'package:school_sync/data.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

class CreateSchoolUseCase {
  const CreateSchoolUseCase({
    required SchoolsRepository schools,
    required RemoteDatabase remoteDatabase,
  })  : _schools = schools,
        _remoteDatabase = remoteDatabase;

  final SchoolsRepository _schools;
  final RemoteDatabase _remoteDatabase;

  Future<String> call(CreateSchoolData school) async {
    try {
      final ReferenceEntity ref = await _schools.create(school);

      await _remoteDatabase.create(
        tableName: RemoteTables.schools.name,
        fieldAndValue: school.copyWith(id: ref.id).toJson(),
      );

      // TODO(Mujhtech): create school subscription, subscription history both local and remote

      return ref.id;
    } catch (error, stackTrace) {
      AppLog.e(error, stackTrace);
      rethrow;
    }
  }
}
