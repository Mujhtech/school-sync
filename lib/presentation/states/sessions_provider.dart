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
class Sessions extends _$Sessions {
  @override
  Stream<List<SessionViewModel>> build() async* {
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

  Future<String> createSession({
    required String name,
    required String code,
  }) async {
    final Registry registry = ref.read(registryProvider);
    final SchoolViewModel? currentSelectedSchool = await ref
        .watch(currentSelectedSchoolProvider.selectAsync((_) => _.school));

    if (currentSelectedSchool != null) {
      return registry.get<CreateSessionUseCase>().call(
            CreateSessionData(
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

  Future<bool> updateSession({
    required String id,
    required String name,
    required String code,
  }) async {
    final Registry registry = ref.read(registryProvider);

    return registry.get<UpdateSessionUseCase>().call(
          UpdateSessionData(
            id: id,
            name: name,
            code: code,
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
