import 'dart:async';
import 'package:school_sync/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../local_database.dart';

class AuthRemoteImpl implements AuthRepository {
  const AuthRemoteImpl(this._client);

  //final Database _db;
  final SupabaseClient _client;

  @override
  Future<AuthResponse> signin({
    required String password,
    required String email,
  }) async {
    return _client.auth.signInWithPassword(password: password, email: email);
  }

  @override
  Future<AuthResponse> signup({
    required String password,
    required String email,
  }) async {
    return _client.auth.signUp(password: password, email: email);
  }
}
