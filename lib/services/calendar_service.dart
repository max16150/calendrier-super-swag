import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:triilab/models/event.dart';

class CalendarService {
  List<Event> getDataSource({
    required List<Course> courses,
    required normalCourseBackground,
    required specialCourseBackground,
    required canceledCourseBackground,
  }) {
    final List<Event> meetings = <Event>[];

    for (Course course in courses) {
      final bool isCanceled = course.extra.contains('canceled');
      final bool isColored = course.extra.contains('colored');

      meetings.add(
        Event(
          course.title,
          course.startAt.toLocal(),
          course.endAt.toLocal(),
          isCanceled
              ? canceledCourseBackground
              : isColored
                  ? specialCourseBackground
                  : normalCourseBackground,
          false,
          course.rooms,
        ),
      );
    }

    return meetings;
  }

  List<TimeRegion> get getSpecialRegions {
    DateTime startDate = DateTime(1970, 1, 1);
    return [
      // From 07:30 to 08:30
      TimeRegion(
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 7, 30, 0),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 8, 30, 0),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',
      ),
      // From 10:00 to 10:30
      TimeRegion(
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 10, 0, 0),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 10, 30, 0),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',
      ),
      // From 12:00 to 13:30
      TimeRegion(
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 12, 0, 0),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 13, 30, 0),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',
      ),
      // From 15:00 to 15:15
      TimeRegion(
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 15, 0, 0),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 15, 15, 0),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',
      ),
      // from 16:45 to 17:00
      TimeRegion(
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 16, 45, 0),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 17, 0, 0),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',
      ),
      // From 18:30 to 23:59
      TimeRegion(
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 18, 30, 0),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 19, 30, 0),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR',
      ),
    ];
  }
}
