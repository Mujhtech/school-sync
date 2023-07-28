import 'package:school_sync/domain.dart';

class CurrentSchoolIdLocalImpl implements CurrentSchoolIdRepository {
  const CurrentSchoolIdLocalImpl(this._storage);

  final StringLocalStorage _storage;

  @override
  Future<String?> getId() async => _storage.get();

  @override
  Future<bool> changeId(String value) async {
    await _storage.set(value);
    return true;
  }
}
