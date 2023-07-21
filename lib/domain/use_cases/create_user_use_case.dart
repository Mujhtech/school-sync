import 'package:school_sync/core.dart';
import 'package:school_sync/domain.dart';

class CreateUserUseCase {
  const CreateUserUseCase({required UsersRepository users}) : _users = users;

  final UsersRepository _users;

  Future<UserEntity?> call(String id, AccountEntity account) async {
    try {
      return _users.create(id, account);
    } catch (error, stackTrace) {
      AppLog.e(error, stackTrace);
      return null;
    }
  }
}
