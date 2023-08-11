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
class Subjects extends _$Subjects {
  @override
  Stream<List<SubjectViewModel>> build() async* {
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

  Future<String> createSubject({
    required String title,
    required String code,
    required int? unit,
  }) async {
    final Registry registry = ref.read(registryProvider);
    final SchoolViewModel? currentSelectedSchool = await ref
        .watch(currentSelectedSchoolProvider.selectAsync((_) => _.school));

    if (currentSelectedSchool != null) {
      return registry.get<CreateSubjectUseCase>().call(
            CreateSubjectData(
              title: title,
              unit: unit,
              code: code,
              school: (
                id: currentSelectedSchool.id,
                path: currentSelectedSchool.path
              ),
            ),
          );
    } else {
      throw 'Select school to continue';
    }
  }

  Future<bool> updateSubject({
    required String id,
    required String title,
    required String code,
    required int? unit,
  }) async {
    final Registry registry = ref.read(registryProvider);

    return registry.get<UpdateSubjectUseCase>().call(
          UpdateSubjectData(
            id: id,
            code: code,
            title: title,
            unit: unit,
          ),
        );
  }

  Future<bool> delete({
    required ReferenceEntity plan,
    required ReferenceEntity metadata,
  }) async {
    // final Registry registry = ref.read(registryProvider);
    // final UserEntity user = await ref.watch(userProvider.future);

    return true;
  }
}
