import 'package:equatable/equatable.dart';
import 'package:school_sync/domain.dart';

class ClassViewModel with EquatableMixin {
  const ClassViewModel({
    required this.id,
    required this.path,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String path;
  final String name;
  final String? code;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  static ClassViewModel fromEntity(ClassEntity entity) {
    return ClassViewModel(
      id: entity.id,
      path: entity.path,
      name: entity.name,
      code: entity.code,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }

  @override
  List<Object?> get props =>
      <Object?>[id, name, path, code, createdAt, updatedAt, deletedAt];
}
