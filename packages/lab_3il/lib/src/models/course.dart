import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int courseId;
  final List<String> rooms;
  final DateTime startAt;
  final DateTime endAt;
  final String title;
  final List<String> extra;
  final DateTime? deletedAt;

  const Course({
    required this.courseId,
    required this.rooms,
    required this.startAt,
    required this.endAt,
    required this.title,
    required this.extra,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [courseId, rooms, startAt, endAt, title, extra, deletedAt];

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'],
      rooms: json['rooms'].cast<String>(),
      startAt: DateTime.parse(json['start_at']),
      endAt: DateTime.parse(json['end_at']),
      title: json['title'],
      extra: json['extra'].cast<String>(),
      deletedAt: json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']),
    );
  }
}
