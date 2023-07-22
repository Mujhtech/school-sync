import 'package:collection/collection.dart';
import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain/entities/school_entity.dart';
import 'package:school_sync/domain/entities/user_entity.dart';
import 'package:school_sync/domain/use_cases/fetch_schools_use_case.dart';
import 'package:school_sync/presentation/models/school_view_model.dart';

import 'registry_provider.dart';
import 'user_provider.dart';

part 'schools_provider.g.dart';

@Riverpod(dependencies: <Object>[registry, user])
Stream<List<SchoolViewModel>> schools(SchoolsRef ref) async* {
  final Registry registry = ref.read(registryProvider);
  final UserEntity? user = await ref.watch(userProvider.future);

  yield* registry.get<FetchSchoolsUseCase>().call(user!.id).map(
        (SchoolEntityList schools) => schools
            .map(SchoolViewModel.fromEntity)
            .sorted(
              (SchoolViewModel a, SchoolViewModel b) =>
                  b.createdAt.compareTo(a.createdAt),
            )
            .toList(growable: false),
      );
}
