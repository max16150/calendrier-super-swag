import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:triilab/extension.dart';

class FreeRooms extends StatefulWidget {
  const FreeRooms({super.key});

  @override
  State<FreeRooms> createState() => _FreeRooms();
}

class _FreeRooms extends State<FreeRooms> {
  @override
  Widget build(BuildContext context) {
    //final lab_api.Lab3il lab = context.read<lab_api.Lab3il>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('free_rooms')),
      ),
      /*
      body: FutureBuilder<lab_api.Informations>(
        future: lab.informationsService.getInformations(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(context.tr('error_occured')),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final lab_api.Informations infos = snapshot.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: TitledButtonList(
                  title: "Salles libres",
                  rooms: infos.freeRoomsNow,
                  onTap: () {},
                ),
              ),
            ],
          );
        },
      ),
      */
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.update_outlined,
                size: 64,
              ),
              const Gap(16),
              Text(
                context.tr('feature_coming_soon'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
