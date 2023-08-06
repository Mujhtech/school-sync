import 'package:equatable/equatable.dart';

class CreateSyncLogData with EquatableMixin {
  const CreateSyncLogData({
    required this.record,
    required this.recordId,
    required this.userId,
    required this.schoolId,
    required this.type,
  });
  final String type;
  final String record;
  final String? userId;
  final String? schoolId;
  final String? recordId;

  @override
  List<Object?> get props =>
      <Object?>[type, record, recordId, userId, schoolId];
}
