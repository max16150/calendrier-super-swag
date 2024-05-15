import 'package:equatable/equatable.dart';

class GroupWorkload extends Equatable {
  final int groupId;
  final int totalTime;

  const GroupWorkload({
    required this.groupId,
    required this.totalTime,
  });

  @override
  List<Object> get props => [groupId, totalTime];

  factory GroupWorkload.fromJson(Map<String, dynamic> json) {
    return GroupWorkload(
      groupId: json['group'],
      totalTime: json['total_time'],
    );
  }
}
