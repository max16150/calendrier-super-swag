import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart' as lab_api;
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';

class Informations extends StatefulWidget {
  const Informations({super.key});

  @override
  State<Informations> createState() => _Informations();
}

class _Informations extends State<Informations> {
  @override
  Widget build(BuildContext context) {
    final lab_api.Lab3il lab = context.read<lab_api.Lab3il>();
    return Scaffold(
      body: FutureBuilder<lab_api.Informations>(
          future: lab.informationsService.getInformations(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(context.tr("error")),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final lab_api.Informations infos = snapshot.data!;
            return Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TitledButton(
                    title: "Salles libres",
                    subtitle: "${infos.freeRoomsNow.length} salles libres",
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TitledButton(
                    title: "Pause Matinale",
                    subtitle: "${infos.morningBreak} Groupes concernés",
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TitledButton(
                    title: "Pause du midi",
                    subtitle: "${infos.launchBreak} Groupes concernés",
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ListTileExample(
                      heures: "${infos.totalCoursesTimeThisWeek / 60}",
                      salle: infos.mostUsedRoomThisWeek
                          .map((e) => e.room)
                          .join(", "),
                      groupePlus: infos.mostCoursedGroupThisWeek
                          .map((e) =>
                              e.groupId) // TODO: utiliser le nom des groupes
                          .join(", "),
                      groupeMoins: infos.leastCoursedGroupThisWeek
                          .map((e) => e.groupId)
                          .join(", ")),
                ),
                Container(
                  constraints:
                      const BoxConstraints(minWidth: 200, minHeight: 60),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.grey,
                      child: InkWell(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 1),
                                    child: Text("Notes"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(minWidth: 200, minHeight: 60),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.grey,
                      child: InkWell(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 1),
                                    child: Text("Moodle"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class TitledButton extends StatelessWidget {
  const TitledButton({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      color: Colors.grey,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Text(title),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Text(subtitle),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_right_outlined)
          ],
        ),
      ),
    );
  }
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({
    super.key,
    required this.heures,
    required this.salle,
    required this.groupePlus,
    required this.groupeMoins,
  });

  final String heures;
  final String salle;
  final String groupePlus;
  final String groupeMoins;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // Added to prevent unbounded height error
      physics:
          const NeverScrollableScrollPhysics(), // Prevents the ListView from being scrollable
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.timelapse_outlined),
          title: Text('$heures' ' Heures'),
          subtitle: const Text('Heures de cours cumulés cette semaine'),
        ),
        ListTile(
          leading: const Icon(Icons.room_preferences_outlined),
          title: Text(salle),
          subtitle: const Text('Salle la plus utilisée cette semaine'),
        ),
        ListTile(
          leading: const Icon(Icons.more_time_outlined),
          title: Text(groupePlus),
          subtitle: const Text(
              "Classes(s) avec le moins d'heures de cours cette semaine"),
        ),
        ListTile(
          leading: const Icon(Icons.bedtime_off_outlined),
          title: Text(groupeMoins),
          subtitle: const Text(
              "Classes(s) avec le moins d'heures de cours cette semaine"),
          isThreeLine: true,
        ),
        const Divider(height: 0),
      ],
    );
  }
}
