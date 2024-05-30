import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';
// Assurez-vous d'importer les fichiers nécessaires

extension TextStyleRoboto on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply.
class CustomTextStyles {
  // Body text style
  static TextStyle bodyLargeOnPrimaryContainer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return themeProvider.themeMode == ThemeMode.dark
        ? Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: themeProvider.seedColor, // Utilisez la couleur de base pour le thème sombre
          )
        : Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer, // Couleur par défaut pour le thème clair
          );
  }

  static TextStyle bodyMediumGray400(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return themeProvider.themeMode == ThemeMode.dark
        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: themeProvider.seedColor.withOpacity(0.6), // Utilisez la couleur de base avec opacité pour le thème sombre
          )
        : Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.grey[400], // Couleur par défaut pour le thème clair
          );
  }

  // Title text style
  static TextStyle titleSmallOnPrimaryContainer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return themeProvider.themeMode == ThemeMode.dark
        ? Theme.of(context).textTheme.titleSmall!.copyWith(
            color: themeProvider.seedColor.withOpacity(1), // Utilisez la couleur de base pour le thème sombre
          )
        : Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1), // Couleur par défaut pour le thème clair
          );
  }

  static TextStyle titleSmallPurple50(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return themeProvider.themeMode == ThemeMode.dark
        ? Theme.of(context).textTheme.titleSmall!.copyWith(
            color: themeProvider.seedColor, // Utilisez la couleur de base pour le thème sombre
          )
        : Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.purple[50], // Couleur par défaut pour le thème clair
          );
  }
}
