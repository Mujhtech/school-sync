import 'package:equatable/equatable.dart';

class UserEntity with EquatableMixin {
  const UserEntity({
    required this.id,
    required this.path,
    this.deletedAt,
    required this.email,
    required this.updatedAt,
    required this.firstName,
    required this.createdAt,
    required this.lastName,
    required this.phoneNumber,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String path;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props => <Object?>[
        id,
        path,
        firstName,
        lastName,
        email,
        phoneNumber,
        createdAt,
        updatedAt,
        deletedAt
      ];
}
