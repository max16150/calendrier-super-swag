import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/models/event.dart';
import 'package:triilab/models/event_data_source.dart';
import 'package:triilab/services/calendar_service.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

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
  late final CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  /*
  Provider.of<Lab3il>(context, listen: false).agendaService.getAgenda(
    groupId: "43",
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now().add(const Duration(days: 7)),
  )
  */
  /*
  EventDataSource(CalendarService().getDataSource(
    courses: snapshot.data?.courses ?? [],
    normalCourseBackground: context.colors.primary,
    specialCourseBackground: context.colors.secondary,
    canceledCourseBackground: context.colors.error,
  ))
  */

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      controller: _calendarController,
      view: CalendarView.workWeek,
      loadMoreWidgetBuilder: (BuildContext context, LoadMoreCallback loadMoreAppointments) {
        return FutureBuilder<void>(
          future: loadMoreAppointments(),
          builder: (context, snapShot) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          },
        );
      },
      dataSource: EventDataSource(
        <Event>[],
        lab: Provider.of<Lab3il>(context, listen: false),
        normalCourseBackground: context.colors.primary,
        specialCourseBackground: context.colors.secondary,
        canceledCourseBackground: context.colors.error,
      ),
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 7.5,
        endHour: 19.5,
        timeFormat: 'HH:mm',
      ),
      headerHeight: 0,
      viewHeaderHeight: 80,
      specialRegions: CalendarService().getSpecialRegions,
      onTap: (CalendarTapDetails details) {
        if (details.targetElement == CalendarElement.appointment) {
          final Event meeting = details.appointments!.first;
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
