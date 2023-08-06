import 'package:equatable/equatable.dart';

import 'reference_entity.dart';

class CreateSubjectData with EquatableMixin {
  const CreateSubjectData({
    required this.title,
    required this.code,
    required this.unit,
    required this.school,
  });
  final String title;
  final String? code;
  final int? unit;
  final ReferenceEntity school;

  @override
  List<Object?> get props => <Object?>[title, code, unit, school];
}
