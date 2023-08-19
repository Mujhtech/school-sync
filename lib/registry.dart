import 'package:flutter/foundation.dart';
import 'package:registry/registry.dart';
import 'package:school_sync/data.dart';
import 'package:school_sync/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Registry createRegistry({
  required RemoteDatabase remoteDatabase,
  required Repository repository,
  required SupabaseClient supabase,
  required SharedPreferences storage,
}) =>
    Registry()

      /// Repositories.
      ..set(supabase)
      ..set(storage)
      ..set(remoteDatabase)
      ..set(repository.auth)
      ..set(repository.users)
      ..set(repository.schools)
      ..set(repository.preferences)
      ..set(repository.currentSchool)
      ..set(repository.sessions)
      ..set(repository.subjects)
      ..set(repository.classes)

      /// UseCases.
      ..factory((RegistryFactory di) => RegisterUseCase(auth: di()))
      ..factory((RegistryFactory di) => LoginUseCase(auth: di()))
      ..factory((RegistryFactory di) => CreateUserUseCase(users: di()))
      ..factory(
          (RegistryFactory di) => FetchUserUseCase(users: di(), auth: di()))

      //
      ..factory(
        (RegistryFactory di) =>
            CreateSchoolUseCase(schools: di(), remoteDatabase: di()),
      )
      ..factory((RegistryFactory di) => FetchSchoolsUseCase(schools: di()))
      ..factory((RegistryFactory di) => FetchSchoolUseCase(schools: di()))
      //
      ..factory(
          (RegistryFactory di) => UpdateAppThemeUseCase(preferences: di()))
      ..factory((RegistryFactory di) => FetchAppThemeUseCase(preferences: di()))

      ///
      ..factory(
        (RegistryFactory di) =>
            UpdateCurrentSchoolIdUseCase(currentSchool: di()),
      )
      ..factory(
        (RegistryFactory di) =>
            FetchCurrentSchoolIdUseCase(currentSchool: di()),
      )

      //
      ..factory(
        (RegistryFactory di) => FetchSubjectsUseCase(subjectsRepository: di()),
      )
      ..factory(
        (RegistryFactory di) => UpdateSubjectUseCase(subjectsRepository: di()),
      )
      ..factory(
        (RegistryFactory di) => CreateSubjectUseCase(subjectsRepository: di()),
      )

      //
      ..factory(
        (RegistryFactory di) => FetchClassesUseCase(classesRepository: di()),
      )
      ..factory(
        (RegistryFactory di) => UpdateClassUseCase(classesRepository: di()),
      )
      ..factory(
        (RegistryFactory di) => CreateClassUseCase(classesRepository: di()),
      )

      //
      ..factory(
        (RegistryFactory di) => FetchSessionsUseCase(sessionsRepository: di()),
      )
      ..factory(
        (RegistryFactory di) => UpdateSessionUseCase(sessionsRepository: di()),
      )
      ..factory(
        (RegistryFactory di) => CreateSessionUseCase(sessionsRepository: di()),
      )

      /// Repositories.
      ..set(kDebugMode);

class Repository {
  Repository.local(
    Database db,
    SupabaseClient supabase, {
    required StringLocalStorage authIdentityStorage,
    required this.preferences,
    required this.currentSchool,
  })  : auth = AuthRemoteImpl(supabase, authIdentityStorage),
        users = UsersLocalImpl(db),
        schools = SchoolsLocalImpl(db),
        sessions = SessionsLocalImpl(db),
        subjects = SubjectsLocalImpl(db),
        classes = ClassesLocalImpl(db);

  final AuthRepository auth;
  final UsersRepository users;
  final SchoolsRepository schools;
  final CurrentSchoolIdRepository currentSchool;
  final PreferencesRepository preferences;
  final SubjectsRepository subjects;
  final ClassesRepository classes;
  final SessionsRepository sessions;
}
