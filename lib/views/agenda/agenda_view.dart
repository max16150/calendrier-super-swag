import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/models/event.dart';
import 'package:triilab/models/event_data_source.dart';
import 'package:triilab/providers/agenda_provider.dart';
import 'package:triilab/services/calendar_service.dart';

class AgendaView extends StatefulWidget {
  const AgendaView({
    super.key,
    required this.selectedGroup,
  });

  final ClassGroup selectedGroup;

  @override
  State<AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView> {
  late final CalendarController _calendarController;
  late final AgendaProvider agendaProvider;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  onEventTap(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final Event event = details.appointments!.first;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(event.eventName),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.tr('course_from', args: {
                  'time': DateFormat.Hm().format(event.from),
                  'date': DateFormat.yMMMMEEEEd().format(event.from),
                })),
                Text(context.tr('course_to', args: {
                  'time': DateFormat.Hm().format(event.to),
                  'date': DateFormat.yMMMMEEEEd().format(event.to),
                })),
                const Gap(8),
                const Divider(),
                const Gap(8),
                Text(context.tr('rooms')),
                const Gap(4),
                for (final room in event.rooms) Text(room),
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
  }

  @override
  Widget build(BuildContext context) {
    final group = widget.selectedGroup;

    return SfCalendar(
      controller: _calendarController,
      view: CalendarView.workWeek,
      loadMoreWidgetBuilder: (context, LoadMoreCallback loadMoreAppointments) {
        return FutureBuilder<void>(
          future: loadMoreAppointments(),
          builder: (context, snapShot) => Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        );
      },
      dataSource: EventDataSource(
        source: <Event>[],
        classGroup: group,
        lab: Provider.of<Lab3il>(context, listen: false),
        normalCourseBackground: context.colors.primary,
        specialCourseBackground: context.colors.secondary,
        canceledCourseBackground: context.colors.error,
        deletedCourseBackground: context.colors.error,
      ),
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 7.5,
        endHour: 19.5,
        timeFormat: 'HH:mm',
      ),
      headerHeight: 0,
      viewHeaderHeight: 80,
      specialRegions: CalendarService().getSpecialRegions,
      onTap: onEventTap,
      selectionDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}
