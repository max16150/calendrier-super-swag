import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Informations extends StatefulWidget {
  const Informations({super.key});

  @override
  State<Informations> createState() => _Informations();
}

class _Informations extends State<Informations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TitledButton(
              title: "Salles libres",
              subtitle: "20 salles libres",
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TitledButton(
              title: "Pause Matinale",
              subtitle: "12 Groupes concernés",
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TitledButton(
              title: "Pause du midi",
              subtitle: "18 Groupes concernés",
              onTap: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListTileExample(
                heures: "865",
                salle: "305",
                groupePlus: "I2FA Groupe 5",
                groupeMoins: "I1 FA Groupe1"),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 200, minHeight: 60),
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
            constraints: const BoxConstraints(minWidth: 200, minHeight: 60),
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
      ),
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
          title: Text('$heures Heures'),
          subtitle: const Text('Heures de cours cumulés cette semaine'),
        ),
        ListTile(
          leading: const Icon(Icons.room_preferences_outlined),
          title: Text(salle),
          subtitle: const Text('Salle la plus utilisée cette semaine'),
        ),
        ListTile(
          leading: const Icon(Icons.room_preferences_outlined),
          title: Text(salle),
          subtitle: const Text('Salle la plus utilisée cette semaine'),
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
