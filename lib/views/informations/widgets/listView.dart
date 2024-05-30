// ignore: file_names
import 'package:flutter/material.dart';

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
      shrinkWrap: true, // Prevents unbounded height error
      physics:
          const NeverScrollableScrollPhysics(), // Prevents the ListView from being scrollable
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.timelapse_outlined),
          title: Text('$heures heures'),
          subtitle: const Text('Heures de cours cumulées cette semaine'),
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
              "Classes(s) avec le plus d'heures de cours cette semaine"),
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
