import 'dart:async';
import 'package:school_sync/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../local_database.dart';

class AuthRemoteImpl implements AuthRepository {
  const AuthRemoteImpl(this._client, this._storage);

  //final Database _db;
  final SupabaseClient _client;
  final StringLocalStorage _storage;

  @override
  Future<AuthResponse> signin({
    required String password,
    required String email,
  }) async {
    final AuthResponse response =
        await _client.auth.signInWithPassword(password: password, email: email);

    if (response.user != null) {
      _storage.set(response.user?.id ?? '');
    }

    // TODO(Mujhtech): Save auth token

    return response;
  }

  @override
  Future<AuthResponse> signup({
    required String password,
    required String email,
  }) async {
    final AuthResponse response =
        await _client.auth.signUp(password: password, email: email);

    if (response.user != null) {
      _storage.set(response.user?.id ?? '');
    }

    // TODO(Mujhtech): Save auth token

    return response;
  }

  @override
  Future<String?> getCurrentUserId() async {
    final String? userId = await _storage.get();
    if (userId != null && userId.isNotEmpty) {
      return userId;
    }

    return _client.auth.currentUser?.id;
  }
}
