import 'package:collection/collection.dart';
import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

part 'classes_provider.g.dart';

@Riverpod(
  dependencies: <Object>[
    registry,
    CurrentSelectedSchool,
  ],
)
Stream<List<ClassViewModel>> classes(ClassesRef ref) async* {
  final Registry registry = ref.read(registryProvider);
  final String? currentSelectedSchoolId =
      await ref.watch(currentSelectedSchoolProvider.selectAsync((_) => _.id));

  if (currentSelectedSchoolId != null) {
    yield* registry
        .get<FetchClassesUseCase>()
        .call(currentSelectedSchoolId)
        .map(
          (ClassEntityList subjects) => subjects
              .map(ClassViewModel.fromEntity)
              .sorted(
                (ClassViewModel a, ClassViewModel b) =>
                    b.createdAt.compareTo(a.createdAt),
              )
              .toList(growable: false),
        );
  }
}
