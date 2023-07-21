import 'package:supabase_flutter/supabase_flutter.dart';

import '../entities/account_entity.dart';
import '../repositories/auth.dart';

class LoginUseCase {
  const LoginUseCase({
    required AuthRepository auth,
    //required Analytics analytics,
  }) : _auth = auth;
  // _analytics = analytics;

  final AuthRepository _auth;
  //final Analytics _analytics;

  Future<AuthResponse> call(AccountEntity account) {
    //_analytics.log(AnalyticsEvent.createUser(account.id)).ignore();
    return _auth.signin(password: account.password, email: account.email);
  }
}
