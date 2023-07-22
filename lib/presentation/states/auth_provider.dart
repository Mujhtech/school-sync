import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'registry_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(dependencies: <Object>[registry])
AuthProvider auth(AuthRef ref) {
  final RegistryFactory di = ref.read(registryProvider).get;

  return AuthProvider(
    loginUseCase: di(),
    registerUseCase: di(),
    fetchUserUseCase: di(),
    createUserUseCase: di(),
  );
}

class AuthProvider {
  const AuthProvider({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required FetchUserUseCase fetchUserUseCase,
    required CreateUserUseCase createUserUseCase,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _fetchUserUseCase = fetchUserUseCase,
        _createUserUseCase = createUserUseCase;

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final FetchUserUseCase _fetchUserUseCase;
  final CreateUserUseCase _createUserUseCase;

  Future<UserEntity?> login(AccountEntity account) async {
    try {
      final AuthResponse res = await _loginUseCase(account);

      if (res.user != null) {
        return _fetchUserUseCase();
      }

      throw 'Unable to login';
    } on AuthException catch (err) {
      throw err.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserEntity?> register(AccountEntity account) async {
    try {
      final AuthResponse res = await _registerUseCase(account);

      if (res.user != null) {
        return _createUserUseCase(res.user!.id, account);
      }

      throw 'Unable to complete account registraction';
    } on AuthException catch (err) {
      throw err.message;
    } catch (e) {
      rethrow;
    }
  }
}
