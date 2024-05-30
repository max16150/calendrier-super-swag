import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions d\'utilisation'),
        centerTitle: true,
        backgroundColor: themeProvider.themeMode == ThemeMode.dark
            ? themeProvider
                .seedColor // Utilisez la couleur de base pour le thème sombre
            : Theme.of(context)
                .colorScheme
                .primary, // Couleur par défaut pour le thème clair
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article 1
            Text(
              'Article 1. DÉFINITIONS',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode == ThemeMode.dark
                    ? themeProvider
                        .seedColor // Utilisez la couleur de base pour le thème sombre
                    : Theme.of(context)
                        .colorScheme
                        .primary, // Couleur par défaut pour le thème clair
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.5,
                color: themeProvider.themeMode == ThemeMode.dark
                     ? Colors
                        .white // Vous pouvez choisir une couleur appropriée pour le texte en mode sombre
                    : Colors
                        .black, // Et une couleur appropriée pour le texte en mode clair
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            // autres contenus
                        // Article 1
            Text(
              'Article 2. APPLICATION',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode == ThemeMode.dark
                    ? themeProvider
                        .seedColor // Utilisez la couleur de base pour le thème sombre
                    : Theme.of(context)
                        .colorScheme
                        .primary, // Couleur par défaut pour le thème clair
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.5,
                color: themeProvider.themeMode == ThemeMode.dark
                    ? Colors
                        .white // Vous pouvez choisir une couleur appropriée pour le texte en mode sombre
                    : Colors
                        .black, // Et une couleur appropriée pour le texte en mode clair
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
