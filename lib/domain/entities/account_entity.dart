import 'package:equatable/equatable.dart';

class AccountEntity with EquatableMixin {
  const AccountEntity({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => <Object?>[email, password];
}
