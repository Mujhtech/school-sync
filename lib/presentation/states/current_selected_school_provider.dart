import 'package:equatable/equatable.dart';
import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';

part 'current_selected_school_provider.g.dart';

@Riverpod(dependencies: <Object>[registry])
class CurrentSelectedSchool extends _$CurrentSelectedSchool {
  @override
  Future<CurrentSelectedSchoolState> build() async {
    final RegistryFactory di = ref.read(registryProvider).get;

    final String? currentSchoolId =
        await di<FetchCurrentSchoolIdUseCase>().call();

    SchoolViewModel? school;

    if (currentSchoolId != null) {
      final SchoolEntity? data =
          await di<FetchSchoolUseCase>().call(currentSchoolId);

      if (data != null) {
        school = SchoolViewModel.fromEntity(data);
      }
    }

    return CurrentSelectedSchoolState(school: school, id: currentSchoolId);
  }

  Future<bool> changeCurrentSchool(String id) async {
    ref.invalidateSelf();
    return ref
        .read(registryProvider)
        .get<UpdateCurrentSchoolIdUseCase>()
        .call(id);
  }
}

class CurrentSelectedSchoolState with EquatableMixin {
  const CurrentSelectedSchoolState({
    required this.school,
    required this.id,
  });

  final String? id;
  final SchoolViewModel? school;

  @override
  List<Object?> get props => <Object?>[id, school];
}
