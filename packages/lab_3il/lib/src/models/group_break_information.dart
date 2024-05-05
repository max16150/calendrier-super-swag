import 'package:equatable/equatable.dart';

class GroupBreakInformation extends Equatable {
  final String group;
  final int groupId;
  final DateTime breakEndsAt;

  const GroupBreakInformation({
    required this.group,
    required this.groupId,
    required this.breakEndsAt,
  });

  @override
  List<Object> get props => [group, groupId, breakEndsAt];

  factory GroupBreakInformation.fromJson(Map<String, dynamic> json) {
    return GroupBreakInformation(
      group: json['group'],
      groupId: json['group_id'],
      breakEndsAt: DateTime.parse(json['break_ends_at']),
    );
  }
}
