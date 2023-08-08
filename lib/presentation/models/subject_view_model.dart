import 'package:equatable/equatable.dart';
import 'package:school_sync/domain.dart';

class SubjectViewModel with EquatableMixin {
  const SubjectViewModel({
    required this.id,
    required this.path,
    required this.title,
    required this.code,
    required this.unit,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String path;
  final String title;
  final String? code;
  final int? unit;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  static SubjectViewModel fromEntity(SubjectEntity entity) {
    return SubjectViewModel(
      id: entity.id,
      path: entity.path,
      title: entity.title,
      unit: entity.unit,
      code: entity.code,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }

  @override
  List<Object?> get props =>
      <Object?>[id, title, path, unit, code, createdAt, updatedAt, deletedAt];
}
