import 'package:equatable/equatable.dart';

class SchoolEntity with EquatableMixin {
  const SchoolEntity({
    required this.id,
    required this.path,
    required this.userId,
    required this.name,
    required this.email,
    required this.logo,
    required this.acronyms,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String path;
  final String userId;
  final String name;
  final String? acronyms;
  final String? logo;
  final double? longitude;
  final double? latitude;
  final String email;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props => <Object?>[
        id,
        path,
        userId,
        name,
        logo,
        acronyms,
        latitude,
        longitude,
        email,
        address,
        createdAt,
        updatedAt,
        deletedAt
      ];
}

typedef SchoolEntityList = List<SchoolEntity>;
