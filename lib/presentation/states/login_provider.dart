import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/domain/use_cases/create_user_use_case.dart';
import 'package:school_sync/domain/use_cases/fetch_user_use_case.dart';
import 'package:school_sync/domain/use_cases/login_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'registry_provider.dart';

part 'login_provider.g.dart';

@Riverpod(dependencies: <Object>[registry])
Future<UserEntity?> login(LoginRef ref, AccountEntity account) async {
  final Registry registry = ref.read(registryProvider);

  final AuthResponse res = await registry.get<LoginUseCase>().call(account);

  if (res.user != null) {
    return registry.get<FetchUserUseCase>().call(res.user!.id);
  }

  return null;
}
