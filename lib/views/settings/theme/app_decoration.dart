import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';


class AppDecoration {
  // Fill decorations
  static BoxDecoration fillOnPrimary(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BoxDecoration(
      color: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Theme.of(context).colorScheme.onPrimary, // Utilisez la couleur onPrimary pour le thème clair
    );
  }

  static BoxDecoration fillPrimaryContainer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BoxDecoration(
      color: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Theme.of(context).colorScheme.primaryContainer, // Utilisez la couleur primaryContainer pour le thème clair
    );
  }

  static BoxDecoration fillWhiteA(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BoxDecoration(
      color: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Colors.white, // Utilisez la couleur blanche pour le thème clair
    );
  }
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(16);
}
