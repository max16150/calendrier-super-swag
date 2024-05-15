import 'package:flutter/material.dart';

class Informations extends StatefulWidget {
  const Informations({super.key});

  @override
  State<Informations> createState() => _Informations();
}

class _Informations extends State<Informations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey,
                    child: InkWell(
                        onTap: () {},
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text('Salles Libres'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text('Sous titres'),
                              ),
                            ])),
                  )))
        ]),
        Row(children: [
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey,
                    child: InkWell(
                        onTap: () {},
                        child: const Row(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 1),
                                  child: Text('Pause Matinale'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 1),
                                  child: Text('Sous titres'),
                                ),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end
                            //Ajout icone ?
                          )
                        ])),
                  )))
        ]),
        Row(children: [
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey,
                    child: InkWell(
                        onTap: () {},
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text('Pause de midi'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text('Sous titres'),
                              ),
                            ])),
                  )))
        ]),
      ]),
    );
  }
}
