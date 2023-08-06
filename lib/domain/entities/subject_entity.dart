import 'package:equatable/equatable.dart';

import 'school_entity.dart';

class BaseSubjectEntity<U> with EquatableMixin {
  const BaseSubjectEntity({
    required this.id,
    required this.path,
    required this.school,
    required this.title,
    required this.code,
    required this.unit,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String title;
  final String path;
  final U school;
  final String? code;
  final int? unit;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props =>
      <Object?>[id, path, school, title, code, createdAt, updatedAt, deletedAt];
}

typedef SubjectEntity = BaseSubjectEntity<SchoolEntity>;

typedef SubjectEntityList = List<SubjectEntity>;
