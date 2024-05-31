import 'package:equatable/equatable.dart';
import 'package:lab_3il/src/models/course.dart';

class Agenda extends Equatable {
  final int groupId;
  final DateTime updatedAt;
  final DateTime lastCheck;
  final List<Course> courses;

  const Agenda({
    required this.groupId,
    required this.updatedAt,
    required this.lastCheck,
    required this.courses,
  });

  @override
  List<Object> get props => [groupId, updatedAt, lastCheck, courses];

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      groupId: json['group_id'],
      updatedAt: DateTime.parse(json['updated_at']),
      lastCheck: DateTime.parse(json['last_check']),
      courses: (json['courses'] as List).map((course) => Course.fromJson(course)).toList(),
    );
  }
}
