import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';
 // Assurez-vous d'importer les fichiers nécessaires

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle fillPrimary(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ElevatedButton.styleFrom(
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Theme.of(context).colorScheme.primary, // Utilisez la couleur primaire pour le thème clair
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
  );
}
