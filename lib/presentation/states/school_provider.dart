import 'package:registry/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'registry_provider.dart';

part 'school_provider.g.dart';

@Riverpod(dependencies: <Object>[registry])
SchoolProvider school(SchoolRef ref) {
  final RegistryFactory di = ref.read(registryProvider).get;

  return SchoolProvider(createSchoolUseCase: di());
}

class SchoolProvider {
  const SchoolProvider({
    required CreateSchoolUseCase createSchoolUseCase,
  }) : _createSchoolUseCase = createSchoolUseCase;

  final CreateSchoolUseCase _createSchoolUseCase;

  Future<String> create(CreateSchoolData school) async {
    try {
      final String res = await _createSchoolUseCase(school);

      return res;
    } on AuthException catch (err) {
      throw err.message;
    } catch (e) {
      rethrow;
    }
  }
}
