import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';

import 'registry_provider.dart';

part 'user_provider.g.dart';

@Riverpod(dependencies: <Object>[registry])
Future<UserEntity> user(UserRef ref) async =>
    ref.read(registryProvider).get<FetchUserUseCase>().call();
