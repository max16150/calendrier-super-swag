import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:triilab/extension.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _AgendaView(),
    );
  }
}

class _AgendaView extends StatefulWidget {
  const _AgendaView();

  @override
  State<_AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<_AgendaView> {
  List<Course> _getDataSource() {
    final List<Course> meetings = <Course>[];
    final DateTime today = DateTime.now();

    final normalCourseBackground = context.colors.tertiary;
    final specialCourseBackground = context.colors.primary;
    final canceledCourseBackground = context.colors.onSurface;

    final DateTime startTime = DateTime(today.year, today.month, today.day, 8, 30, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 1, minutes: 30));
    meetings.add(Course('Conference', startTime, endTime, normalCourseBackground, false));

    final DateTime startTime2 = DateTime(today.year, today.month, today.day, 10, 30, 0);
    final DateTime endTime2 = startTime2.add(const Duration(hours: 1, minutes: 30));
    meetings.add(Course('Meeting', startTime2, endTime2, normalCourseBackground, false));

    final DateTime startTime3 = DateTime(today.year, today.month, today.day, 13, 30, 0);
    final DateTime endTime3 = startTime3.add(const Duration(hours: 1, minutes: 30));
    meetings.add(Course('Planning', startTime3, endTime3, specialCourseBackground, false));

    final DateTime startTime4 = DateTime(today.year, today.month, today.day, 15, 15, 0);
    final DateTime endTime4 = startTime4.add(const Duration(hours: 1, minutes: 30));
    meetings.add(Course('Support', startTime4, endTime4, canceledCourseBackground, false));

    return meetings;
  }

  List<TimeRegion> get _getSpecialRegions {
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

  late final CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      controller: _calendarController,
      view: CalendarView.workWeek,
      dataSource: CourseDataSource(_getDataSource()),
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 7.5,
        endHour: 19.5,
        //timeFormat: 'HH:mm',
        // Get the time format from the locale
      ),
      headerHeight: 0,
      viewHeaderHeight: 80,
      specialRegions: _getSpecialRegions,
      onTap: (CalendarTapDetails details) {
        if (details.targetElement == CalendarElement.appointment) {
          final Course meeting = details.appointments!.first;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: Text(meeting.eventName),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.tr('course_from', args: {
                      'time': DateFormat.Hm().format(meeting.from),
                      'date': DateFormat.yMMMMEEEEd().format(meeting.from),
                    })),
                    Text(context.tr('course_to', args: {
                      'time': DateFormat.Hm().format(meeting.to),
                      'date': DateFormat.yMMMMEEEEd().format(meeting.to),
                    })),
                    const Gap(8),
                    const Divider(),
                    const Gap(8),
                    Text(context.tr('rooms')),
                    const Gap(4),
                    for (final room in meeting.rooms) Text(room),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(context.tr('close')),
                  ),
                ],
              );
            },
          );
        }
      },
      selectionDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}

class CourseDataSource extends CalendarDataSource {
  CourseDataSource(List<Course> source) {
    appointments = source;
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

  Course _getCourseData(int index) {
    final dynamic meeting = appointments![index];
    late final Course courseData;
    if (meeting is Course) {
      courseData = meeting;
    }

    return courseData;
  }
}

class Course {
  Course(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  List<String> get rooms => <String>['Room 1', 'Room 2', 'Room 3', 'Room 4'];
}
