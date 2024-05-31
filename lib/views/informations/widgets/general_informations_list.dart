import 'package:flutter/material.dart';
import 'package:triilab/extension.dart';

class GeneralInformationsList extends StatelessWidget {
  const GeneralInformationsList({
    super.key,
    required this.cumulatedCourseHours,
    required this.mostUsedRoom,
    required this.mostWorkingGroups,
    required this.lessWorkingGroups,
  });

  final String cumulatedCourseHours;
  final String mostUsedRoom;
  final String mostWorkingGroups;
  final String lessWorkingGroups;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // Prevents unbounded height error
      physics: const NeverScrollableScrollPhysics(), // Prevents the ListView from being scrollable
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.timelapse_outlined),
          title: Text(context.tr('hours', args: {'count': cumulatedCourseHours})),
          subtitle: Text(context.tr('cumulated_courses_hours_this_week')),
        ),
        ListTile(
          leading: const Icon(Icons.room_preferences_outlined),
          title: Text(mostUsedRoom),
          subtitle: Text(context.tr('most_used_room_this_week')),
        ),
        ListTile(
          leading: const Icon(Icons.more_time_outlined),
          title: Text(mostWorkingGroups),
          subtitle: Text(context.tr('most_working_groups_this_week')),
        ),
        ListTile(
          leading: const Icon(Icons.bedtime_off_outlined),
          title: Text(lessWorkingGroups),
          subtitle: Text(context.tr('less_working_groups_this_week')),
        ),
      ],
    );
  }
}
