import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';
//import 'package:lab_3il/src/models/privacy_policy.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Lab3il lab = Provider.of<Lab3il>(context);


    // Utilisation de FutureBuilder pour laffiachage du content
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? themeProvider.seedColor // couleur de base pour le thème sombre
            : Theme.of(context).colorScheme.primary, // Couleur par défaut pour le thème clair
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ...
            FutureBuilder<PrivacyPolicy>(
              future: lab.informationsService.getPrivacyPolicy(),
              builder: (BuildContext context, AsyncSnapshot<PrivacyPolicy> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? Colors.white // 
                            : Colors.black, // 
                      ),
                      children: [
                        TextSpan(
                          text: snapshot.data?.content,
                        ),
                        // ...
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  );
                }
              },
            ),
            // ...
          ],
        ),
      ),
    );
  }
}
