import 'package:school_sync/domain.dart';

import '../../local_database.dart';

class UsersLocalImpl implements UsersRepository {
  const UsersLocalImpl(this._db);

  final Database _db;

  @override
  Future<UserEntity> create(String id, AccountEntity account) =>
      _db.usersDao.createUser(id, account);

  @override
  Future<UserEntity?> fetch(String uid) => _db.usersDao.getSingleUser(uid);
}
