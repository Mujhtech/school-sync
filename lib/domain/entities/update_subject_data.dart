import 'package:equatable/equatable.dart';

class UpdateSubjectData with EquatableMixin {
  const UpdateSubjectData({
    required this.title,
    required this.code,
    required this.unit,
    required this.id,
  });
  final String? title;
  final String? code;
  final int? unit;
  final String id;

  @override
  List<Object?> get props => <Object?>[title, code, unit, id];
}
