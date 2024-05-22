import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:triilab/models/event.dart';
import 'package:triilab/services/calendar_service.dart';

class EventDataSource extends CalendarDataSource {
  final Lab3il lab;
  final Color normalCourseBackground;
  final Color specialCourseBackground;
  final Color canceledCourseBackground;

  EventDataSource(
    List<Event> source, {
    required this.lab,
    required this.normalCourseBackground,
    required this.specialCourseBackground,
    required this.canceledCourseBackground,
  }) {
    super.appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getCourseData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getCourseData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getCourseData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getCourseData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getCourseData(index).isAllDay;
  }

  Event _getCourseData(int index) {
    final dynamic meeting = super.appointments![index];
    late final Event courseData;
    if (meeting is Event) {
      courseData = meeting;
    }

    return courseData;
  }

  @override
  Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
    debugPrint('handleLoadMore : $startDate - $endDate');
    final start = DateTime(startDate.year, startDate.month, startDate.day, 0, 0, 0).toUtc();
    final end = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59).toUtc();

    final Agenda agenda = await lab.agendaService.getAgenda(
      groupId: "43",
      start: start,
      end: end,
    );

    final courses = CalendarService().getDataSource(
      courses: agenda.courses,
      normalCourseBackground: normalCourseBackground,
      specialCourseBackground: specialCourseBackground,
      canceledCourseBackground: canceledCourseBackground,
    );

    /*
    DateTime date = DateTime(startDate.year, startDate.month, startDate.day);
    DateTime appEndDate = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
    while (date.isBefore(appEndDate)) {
      final List<Event>? data = _dataCollection[date];
      if (data == null) {
        date = date.add(const Duration(days: 1));
        continue;
      }

      for (final Event meeting in data) {
        if (appointments!.contains(meeting)) {
          continue;
        }

        meetings.add(meeting);
      }
      date = date.add(const Duration(days: 1));
    }

    appointments!.addAll(meetings);
    */

    // create a set of appointments and courses to avoid duplicates
    final Set<Event> coursesSet = {};
    coursesSet.addAll(courses);
    coursesSet.addAll(super.appointments!.cast<Event>());

    super.appointments!.clear();
    super.appointments!.addAll(coursesSet);

    notifyListeners(CalendarDataSourceAction.add, courses);
  }
}
