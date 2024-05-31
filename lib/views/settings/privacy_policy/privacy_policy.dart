import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Lab3il lab = context.read<Lab3il>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('privacy_policy')),
      ),
      body: FutureBuilder<PrivacyPolicy>(
        future: lab.informationsService.getPrivacyPolicy(),
        builder: (BuildContext context, AsyncSnapshot<PrivacyPolicy> snapshot) {
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
