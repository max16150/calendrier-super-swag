// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart' as lab_api;
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';

class MorningBreak extends StatefulWidget {
  const MorningBreak({super.key});

  @override
  State<MorningBreak> createState() => _MorningBreak();
}

class _MorningBreak extends State<MorningBreak> {
  @override
  Widget build(BuildContext context) {
    final lab_api.Lab3il lab = context.read<lab_api.Lab3il>();
    return Scaffold(
      appBar: AppBar(title: const Text("Morning Break")),
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
            return const Column();
          }),
    );
  }
}
