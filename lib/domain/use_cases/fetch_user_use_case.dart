import 'package:school_sync/core.dart';
import 'package:school_sync/domain.dart';

class FetchUserUseCase {
  const FetchUserUseCase({
    required UsersRepository users,
    required AuthRepository auth,
  })  : _users = users,
        _auth = auth;

  final UsersRepository _users;
  final AuthRepository _auth;

  Future<UserEntity?> call() async {
    try {
      final String? id = await _auth.getCurrentUserId();

      if (id == null) {
        throw 'Login to continue';
      }

      return await _users.fetch(id);
    } catch (error, stackTrace) {
      AppLog.e(error, stackTrace);
      return null;
    }
  }
}
