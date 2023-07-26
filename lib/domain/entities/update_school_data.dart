import 'package:equatable/equatable.dart';

class UpdateSchooData with EquatableMixin {
  const UpdateSchooData({
    required this.id,
    required this.name,
    required this.email,
    required this.logo,
    required this.acronyms,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.schoolType,
  });

  final String id;
  final String name;
  final String? acronyms;
  final String? logo;
  final double? longitude;
  final double? latitude;
  final String schoolType;
  final String email;
  final String address;

  @override
  List<Object?> get props => <Object?>[
        id,
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
