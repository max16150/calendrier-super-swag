import 'package:equatable/equatable.dart';

class ClassGroup extends Equatable {
  final int id;
  final String name;
  final DateTime updatedAt;
  final DateTime checkedAt;
  final String? path;
  final DateTime createdAt;
  final DateTime? displayStartAt;
  final DateTime? displayEndAt;
  final DateTime? deletedAt;

  const ClassGroup({
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.checkedAt,
    required this.path,
    required this.createdAt,
    required this.displayStartAt,
    required this.displayEndAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        updatedAt,
        checkedAt,
        path,
        createdAt,
        displayStartAt,
        displayEndAt,
        deletedAt,
      ];

  factory ClassGroup.fromJson(Map<String, dynamic> json) {
    return ClassGroup(
      id: json['id'],
      name: json['name'],
      updatedAt: DateTime.parse(json['updated_at']),
      checkedAt: DateTime.parse(json['checked_at']),
      path: json['path'],
      createdAt: DateTime.parse(json['created_at']),
      displayStartAt: json['display_start_at'] != null ? DateTime.parse(json['display_start_at']) : null,
      displayEndAt: json['display_end_at'] != null ? DateTime.parse(json['display_end_at']) : null,
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}
