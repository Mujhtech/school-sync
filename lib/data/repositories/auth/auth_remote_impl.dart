import 'dart:async';
import 'package:school_sync/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../local_database.dart';

class AuthRemoteImpl implements AuthRepository {
  const AuthRemoteImpl(this._client);

  //final Database _db;
  final SupabaseClient _client;

  @override
  Future<String> signin({
    required String password,
    required String email,
  }) async {
    final AuthResponse auth =
        await _client.auth.signInWithPassword(password: password, email: email);

    return auth.user?.id ?? '';
  }

  @override
  Future<String> signup({
    required String password,
    required String email,
  }) async {
    final AuthResponse auth =
        await _client.auth.signUp(password: password, email: email);

    return auth.user?.id ?? '';
  }
}
