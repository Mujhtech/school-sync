import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse> signin({
    required String password,
    required String email,
  });
  Future<AuthResponse> signup({
    required String password,
    required String email,
  });

  Future<String?> getCurrentUserId();
}
