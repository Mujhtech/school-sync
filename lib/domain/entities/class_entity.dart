import 'package:equatable/equatable.dart';

import 'school_entity.dart';

class BaseClassEntity<T> with EquatableMixin {
  const BaseClassEntity({
    required this.id,
    required this.path,
    required this.school,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String name;
  final String path;
  final T school;
  final String? code;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props =>
      <Object?>[id, path, school, name, code, createdAt, updatedAt, deletedAt];
}

typedef ClassEntity = BaseClassEntity<SchoolEntity>;

typedef ClassEntityList = List<ClassEntity>;
