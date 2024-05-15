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
          /*ListView(
            children: const <Widget>[
              ListTile(
                leading: CircleAvatar(child: Text('A')),
                title: Text('Headline'),
                subtitle: Text('Supporting text'),
              ),
              ListTile(
                leading: CircleAvatar(child: Text('B')),
                title: Text('Headline'),
                subtitle: Text(
                    'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
              ),
              ListTile(
                leading: CircleAvatar(child: Text('C')),
                title: Text('Headline'),
                subtitle: Text(
                    "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
              ),
            ],
          ),*/
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      child: Text(title),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      child: Text(subtitle),
                    ),
                  ]),
            ),
            const Icon(Icons.arrow_right_outlined)
          ],
        ),
      ),
    );
  }
}
