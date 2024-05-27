// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart' as lab_api;
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import './widgets/titledButtonList.dart';

class FreeRooms extends StatefulWidget {
  const FreeRooms({super.key});

  @override
  State<FreeRooms> createState() => _FreeRooms();
}

class _FreeRooms extends State<FreeRooms> {
  @override
  Widget build(BuildContext context) {
    final lab_api.Lab3il lab = context.read<lab_api.Lab3il>();
    return Scaffold(
      appBar: AppBar(title: const Text("Free Rooms")),
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
            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: TitledButtonList(
                  title: "Salles libres",
                  rooms: infos.freeRoomsNow,
                  onTap: () {},
                ),
              ),
            ]);
          }),
    );
  }
}
