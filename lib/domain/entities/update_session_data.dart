import 'package:equatable/equatable.dart';

class UpdateSessionData with EquatableMixin {
  const UpdateSessionData({
    required this.name,
    required this.code,
    required this.id,
  });
  final String? name;
  final String? code;

  final String id;

  @override
  List<Object?> get props => <Object?>[name, code, id];
}
