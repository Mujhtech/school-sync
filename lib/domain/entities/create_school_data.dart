import 'package:equatable/equatable.dart';

class CreateSchooData with EquatableMixin {
  const CreateSchooData({
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

  final String userId;
  final String name;
  final String schoolType;
  final String? acronyms;
  final String? logo;
  final double? longitude;
  final double? latitude;
  final String email;
  final String address;

  @override
  List<Object?> get props => <Object?>[
        userId,
        name,
        logo,
        acronyms,
        schoolType,
        latitude,
        longitude,
        email,
        address,
      ];
}
