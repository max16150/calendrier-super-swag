import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart' as lab_api;
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import './widgets/titledButton.dart';
import './widgets/listView.dart';
import './freeRooms.dart';
import './lunchBreak.dart';
import './MorningBreak.dart';

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
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: TitledButton(
                    title: "Salles libres",
                    subtitle: "${infos.freeRoomsNow.length} salles libres",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FreeRooms()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: TitledButton(
                    title: "Pause Matinale",
                    subtitle: "${infos.morningBreak} Groupes concernés",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MorningBreak()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: TitledButton(
                    title: "Pause du midi",
                    subtitle: "${infos.launchBreak} Groupes concernés",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LunchBreak()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Notes"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Moodle"),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
