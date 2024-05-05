import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String groupName;
  final int groupId;
  final String content;
  final DateTime createdAt;

  const Notification({
    required this.groupName,
    required this.groupId,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object> get props => [groupName, groupId, content, createdAt];

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      groupName: json['group_name'],
      groupId: json['group_id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
