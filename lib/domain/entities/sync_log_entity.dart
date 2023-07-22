import 'package:equatable/equatable.dart';

class SyncLogEntity with EquatableMixin {
  const SyncLogEntity({
    required this.id,
    required this.path,
    this.deletedAt,
    this.userId,
    this.recordId,
    required this.updatedAt,
    required this.type,
    required this.createdAt,
    required this.record,
    this.schoolId,
  });

  final String id;
  final String type;
  final String record;
  final String? userId;
  final String? schoolId;
  final String? recordId;
  final String path;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props => <Object?>[
        id,
        path,
        schoolId,
        record,
        recordId,
        userId,
        type,
        createdAt,
        updatedAt,
        deletedAt
      ];
}
