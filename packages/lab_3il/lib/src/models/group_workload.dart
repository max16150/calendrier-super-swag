import 'package:equatable/equatable.dart';

class GroupWorkload extends Equatable {
  final String group;
  final int totalTime;

  const GroupWorkload({
    required this.group,
    required this.totalTime,
  });

  @override
  List<Object> get props => [group, totalTime];

  factory GroupWorkload.fromJson(Map<String, dynamic> json) {
    return GroupWorkload(
      group: json['group'],
      totalTime: json['total_time'],
    );
  }
}
