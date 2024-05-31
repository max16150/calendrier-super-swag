import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lab_3il/lab_3il.dart' as lab_api;
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/views/informations/morning_break.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/titled_button.dart';
import 'widgets/general_informations_list.dart';
import 'free_rooms.dart';
import 'lunch_break.dart';

class Informations extends StatelessWidget {
  const Informations({super.key});

  Future<(lab_api.Informations, List<lab_api.ClassGroup>)> getInformations({required lab_api.Lab3il lab}) async {
    final lab_api.Informations infos = await lab.informationsService.getInformations();
    final List<lab_api.ClassGroup> groups = await lab.informationsService.getSavedGroups();
    return (infos, groups);
  }

  @override
  Widget build(BuildContext context) {
    final lab_api.Lab3il lab = context.read<lab_api.Lab3il>();
    return FutureBuilder(
      future: getInformations(lab: lab),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(context.tr('error_occured')),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final lab_api.Informations infos = snapshot.data!.$1;
        final List<lab_api.ClassGroup> groups = snapshot.data!.$2;

        final String cumulatedCourseHours = "${infos.totalCoursesTimeThisWeek / 60}";
        final String mostUsedRoom = infos.mostUsedRoomThisWeek.map((e) => e.room).join(", ");
        final String mostWorkingGroups =
            infos.mostCoursedGroupThisWeek.map((e) => groups.firstWhere((g) => g.id == e.groupId).name).join(", ");
        final String lessWorkingGroups =
            infos.leastCoursedGroupThisWeek.map((e) => groups.firstWhere((g) => g.id == e.groupId).name).join(", ");

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TitledButton(
                  title: context.tr('free_rooms'),
                  subtitle: context.tr('free_rooms_count', count: infos.freeRoomsNow.length),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FreeRooms()),
                    );
                  },
                ),
                const Gap(16),
                TitledButton(
                  title: context.tr('morning_break'),
                  subtitle: context.tr('concerned_group_count', count: infos.morningBreak),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MorningBreak()),
                    );
                  },
                ),
                const Gap(16),
                TitledButton(
                  title: context.tr('lunch_break'),
                  subtitle: context.tr('concerned_group_count', count: infos.launchBreak),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LunchBreak()),
                    );
                  },
                ),
                const Gap(16),
                const Divider(height: 0, indent: 16, endIndent: 16),
                const Gap(16),
                GeneralInformationsList(
                  cumulatedCourseHours: cumulatedCourseHours,
                  mostUsedRoom: mostUsedRoom,
                  mostWorkingGroups: mostWorkingGroups,
                  lessWorkingGroups: lessWorkingGroups,
                ),
                const Gap(16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final Uri url = Uri.parse('https://eleves.groupe3il.fr/index.php/notes-et-absences');
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    },
                    child: Text(context.tr('notes_absences')),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse('https://moodle.3il.fr');
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    },
                    child: Text(context.tr('moodle')),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
