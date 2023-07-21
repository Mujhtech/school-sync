import 'package:school_sync/core.dart';

import '../entities/user_entity.dart';
import '../repositories/users.dart';

class FetchUserUseCase {
  const FetchUserUseCase({required UsersRepository users}) : _users = users;

  final UsersRepository _users;

  Future<UserEntity?> call(String uid) async {
    try {
      return _users.fetch(uid);
    } catch (error, stackTrace) {
      AppLog.e(error, stackTrace);
      return null;
    }
  }
}
