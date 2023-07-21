import 'package:equatable/equatable.dart';

class AccountEntity with EquatableMixin {
  const AccountEntity({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  final String email;
  final String password;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;

  @override
  List<Object?> get props =>
      <Object?>[email, password, lastName, firstName, phoneNumber];
}
