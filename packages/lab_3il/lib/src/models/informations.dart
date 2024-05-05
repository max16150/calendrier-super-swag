import 'package:equatable/equatable.dart';
import 'package:lab_3il/src/models/group_workload.dart';
import 'package:lab_3il/src/models/room_availability.dart';
import 'package:lab_3il/src/models/room_usage.dart';

class Informations extends Equatable {
  final int totalCoursesTimeThisWeek;
  final List<RoomUsage> mostUsedRoomThisWeek;
  final List<GroupWorkload> mostCoursedGroupThisWeek;
  final List<GroupWorkload> leastCoursedGroupThisWeek;
  final List<RoomAvailability> freeRoomsNow;
  final int morningBreak;
  final int launchBreak;

  const Informations({
    required this.totalCoursesTimeThisWeek,
    required this.mostUsedRoomThisWeek,
    required this.mostCoursedGroupThisWeek,
    required this.leastCoursedGroupThisWeek,
    required this.freeRoomsNow,
    required this.morningBreak,
    required this.launchBreak,
  });

  @override
  List<Object> get props => [
        totalCoursesTimeThisWeek,
        mostUsedRoomThisWeek,
        mostCoursedGroupThisWeek,
        leastCoursedGroupThisWeek,
        freeRoomsNow,
        morningBreak,
        launchBreak,
      ];

  factory Informations.fromJson(Map<String, dynamic> json) {
    return Informations(
      totalCoursesTimeThisWeek: json['total_courses_time_this_week'],
      mostUsedRoomThisWeek: json['most_used_room_this_week']
          .map(
            (e) => RoomUsage.fromJson(e),
          )
          .toList()
          .cast<RoomUsage>(),
      mostCoursedGroupThisWeek: json['most_coursed_group_this_week']
          .map(
            (e) => GroupWorkload.fromJson(e),
          )
          .toList()
          .cast<GroupWorkload>(),
      leastCoursedGroupThisWeek: json['least_coursed_group_this_week']
          .map(
            (e) => GroupWorkload.fromJson(e),
          )
          .toList()
          .cast<GroupWorkload>(),
      freeRoomsNow: json['free_rooms_now']
          .map(
            (e) => RoomAvailability.fromJson(e),
          )
          .toList()
          .cast<RoomAvailability>(),
      morningBreak: json['morning_break'],
      launchBreak: json['launch_break'],
    );
  }
}
