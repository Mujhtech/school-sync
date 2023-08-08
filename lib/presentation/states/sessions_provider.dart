import 'package:collection/collection.dart';
import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

part 'sessions_provider.g.dart';

@Riverpod(
  dependencies: <Object>[
    registry,
    CurrentSelectedSchool,
  ],
)
Stream<List<SessionViewModel>> sessions(SessionsRef ref) async* {
  final Registry registry = ref.read(registryProvider);
  final String? currentSelectedSchoolId =
      await ref.watch(currentSelectedSchoolProvider.selectAsync((_) => _.id));

  if (currentSelectedSchoolId != null) {
    yield* registry
        .get<FetchSessionsUseCase>()
        .call(currentSelectedSchoolId)
        .map(
          (SessionEntityList subjects) => subjects
              .map(SessionViewModel.fromEntity)
              .sorted(
                (SessionViewModel a, SessionViewModel b) =>
                    b.createdAt.compareTo(a.createdAt),
              )
              .toList(growable: false),
        );
  }
}
