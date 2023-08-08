import 'package:collection/collection.dart';
import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

part 'subjects_provider.g.dart';

@Riverpod(
  dependencies: <Object>[
    registry,
    CurrentSelectedSchool,
  ],
)
Stream<List<SubjectViewModel>> subjects(SubjectsRef ref) async* {
  final Registry registry = ref.read(registryProvider);
  final String? currentSelectedSchoolId =
      await ref.watch(currentSelectedSchoolProvider.selectAsync((_) => _.id));

  if (currentSelectedSchoolId != null) {
    yield* registry
        .get<FetchSubjectsUseCase>()
        .call(currentSelectedSchoolId)
        .map(
          (SubjectEntityList subjects) => subjects
              .map(SubjectViewModel.fromEntity)
              .sorted(
                (SubjectViewModel a, SubjectViewModel b) =>
                    b.createdAt.compareTo(a.createdAt),
              )
              .toList(growable: false),
        );
  }
}
