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
class Classes extends _$Classes {
  @override
  Stream<List<ClassViewModel>> build() async* {
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

  Future<String> createClass({
    required String name,
    required String code,
  }) async {
    final Registry registry = ref.read(registryProvider);
    final SchoolViewModel? currentSelectedSchool = await ref
        .watch(currentSelectedSchoolProvider.selectAsync((_) => _.school));

    if (currentSelectedSchool != null) {
      return registry.get<CreateClassUseCase>().call(
            CreateClassData(
              name: name,
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

  Future<bool> updateClass({
    required String id,
    required String name,
    required String code,
  }) async {
    final Registry registry = ref.read(registryProvider);

    return registry.get<UpdateClassUseCase>().call(
          UpdateClassData(id: id, name: name, code: code),
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
