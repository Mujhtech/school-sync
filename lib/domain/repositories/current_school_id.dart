abstract class CurrentSchoolIdRepository {
  Future<String?> getId();

  Future<bool> changeId(String value);
}
