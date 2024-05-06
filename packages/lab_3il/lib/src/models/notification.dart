import 'package:equatable/equatable.dart';

class AppNotification extends Equatable {
  final String groupName;
  final int groupId;
  final String content;
  final DateTime createdAt;

  const AppNotification({
    required this.groupName,
    required this.groupId,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object> get props => [groupName, groupId, content, createdAt];

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      groupName: json['group_name'],
      groupId: json['group_id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
