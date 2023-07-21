abstract class AuthRepository {
  Future<String> signin({required String password, required String email});
  Future<String> signup({required String password, required String email});
}
