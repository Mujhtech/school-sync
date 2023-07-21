import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/domain/use_cases/create_user_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'registry_provider.dart';

part 'register_provider.g.dart';

@Riverpod(dependencies: <Object>[registry])
Future<UserEntity?> register(RegisterRef ref, AccountEntity account) async {
  final Registry registry = ref.read(registryProvider);

  final AuthResponse res = await registry.get<RegisterUseCase>().call(account);

  if (res.user != null) {
    return registry.get<CreateUserUseCase>().call(res.user!.id, account);
  }

  return null;
}
