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
  final Color deletedCourseBackground;
  final ClassGroup classGroup;

  final List<String> _fetchedDates = [];

  EventDataSource({
    required List<Event> source,
    required this.lab,
    required this.classGroup,
    required this.normalCourseBackground,
    required this.specialCourseBackground,
    required this.canceledCourseBackground,
    required this.deletedCourseBackground,
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
    final start = DateTime(startDate.year, startDate.month, startDate.day, 0, 0, 0).toUtc();
    final end = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59).toUtc();

    if (_fetchedDates.contains(start.toString())) {
      notifyListeners(CalendarDataSourceAction.add, []);
      return;
    }
    _fetchedDates.add(start.toString());

    final Agenda agenda = await lab.agendaService.getAgenda(
      groupId: classGroup.id.toString(),
      start: start,
      end: end,
    );

    final courses = CalendarService().getDataSource(
      courses: agenda.courses,
      normalCourseBackground: normalCourseBackground,
      specialCourseBackground: specialCourseBackground,
      canceledCourseBackground: canceledCourseBackground,
      deletedCourseBackground: deletedCourseBackground,
    );

    // Keep only non deleted courses
    courses.removeWhere((course) => course.course.deletedAt != null);

    // create a set of appointments and courses to avoid duplicates
    final Set<Event> coursesSet = {};
    coursesSet.addAll(courses);
    coursesSet.addAll(super.appointments!.cast<Event>());

    super.appointments!.clear();
    super.appointments!.addAll(coursesSet);

    notifyListeners(CalendarDataSourceAction.add, courses);
  }
}
