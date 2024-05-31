import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    Lab3il lab = context.read<Lab3il>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('gcu')),
      ),
      body: FutureBuilder<Gcu>(
        future: lab.informationsService.getGcu(),
        builder: (BuildContext context, AsyncSnapshot<Gcu> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(context.tr('error_occured')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(
                style: context.textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: snapshot.data?.content,
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          );
        },
      ),
    );
  }
}
