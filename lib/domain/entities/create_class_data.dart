import 'package:equatable/equatable.dart';

import 'reference_entity.dart';

class CreateClassData with EquatableMixin {
  const CreateClassData({
    required this.name,
    required this.code,
    required this.school,
  });
  final String name;
  final String? code;

  final ReferenceEntity school;

  @override
  List<Object?> get props => <Object?>[name, code, school];
}
