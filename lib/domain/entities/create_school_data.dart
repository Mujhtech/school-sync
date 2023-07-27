// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CreateSchoolData with EquatableMixin {
  const CreateSchoolData({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.logo,
    required this.acronyms,
    required this.schoolType,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  CreateSchoolData copyWith({
    String? id,
    String? userId,
    String? name,
    String? schoolType,
    String? acronyms,
    String? logo,
    double? longitude,
    double? latitude,
    String? email,
    String? address,
  }) {
    return CreateSchoolData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      schoolType: schoolType ?? this.schoolType,
      acronyms: acronyms ?? this.acronyms,
      logo: logo ?? this.logo,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  final String? id;
  final String userId;
  final String name;
  final String schoolType;
  final String? acronyms;
  final String? logo;
  final double? longitude;
  final double? latitude;
  final String email;
  final String address;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'name': name,
        'school_type': schoolType,
        'acronyms': acronyms,
        'logo': logo,
        'longitude': longitude,
        'latitude': latitude,
        'email': email,
        'address': address
      };

  @override
  List<Object?> get props => <Object?>[
        userId,
        name,
        logo,
        acronyms,
        id,
        schoolType,
        latitude,
        longitude,
        email,
        address,
      ];
}
