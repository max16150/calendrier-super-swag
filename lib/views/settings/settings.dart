import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/settings_export.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_switch.dart';
import 'Suggestion/suggestion.dart';
import 'PrivacyPolicy/privacyPolicy.dart';
import 'TermsOfUse/termsOfUse.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildNotificationColumn(context),
              const SizedBox(height: 16),
              _buildApplicationColumn(context),
              const SizedBox(height: 16),
              _buildTimezoneColumn(context),
              const SizedBox(height: 28),
              CustomElevatedButton(
                text: "Conditions d'utilisation",
                buttonTextStyle: TextStyle(
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white // Couleur pour le texte en mode sombre
                      : Colors.black, // Couleur pour le texte en mode clair
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const TermsOfUse())));
                },
              ),
              const SizedBox(height: 8),
              CustomElevatedButton(
                text: "Politique de confidentialité",
                buttonTextStyle: TextStyle(
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white // Couleur pour le texte en mode sombre
                      : Colors.black, // Couleur pour le texte en mode clair
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const PrivacyPolicyScreen())));
                },
              ),
              const SizedBox(height: 8),
              CustomElevatedButton(
                text: "Suggérer une amélioration",
                buttonTextStyle: TextStyle(
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white // Couleur pour le texte en mode sombre
                      : Colors.black, // Couleur pour le texte en mode clair
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => Suggestion())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// Section Widget
Widget _buildNotificationColumn(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  bool isSelectedSwitch = false;
  bool isSelectedSwitch1 = false;

  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    decoration: BoxDecoration(
      color: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Theme.of(context).colorScheme.primaryContainer, // Couleur par défaut pour le thème clair
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 2),
        Text(
          "Notifications",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nouvelle semaine",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    width: 259,
                    child: Text(
                      "Je souhaite être notifié quand une ou plusieurs semaines de cours sont ajoutées aux emplois du temps de mes groupes suivis",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSwitch(
              margin: const EdgeInsets.only(
                left: 36,
                top: 20,
                bottom: 23,
              ),
              value: isSelectedSwitch,
              onChange: (value) {
                isSelectedSwitch = value;
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Modifications",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    width: 270,
                    child: Text(
                      "Je souhaite être notifié quand mes emplois du temps suivis subissent des modifications (ajout de cours, modification de salle, annulation, ...)",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSwitch(
              margin: const EdgeInsets.only(
                left: 25,
                top: 20,
                bottom: 23,
              ),
              value: isSelectedSwitch1,
              onChange: (value) {
                isSelectedSwitch1 = value;
              },
            ),
          ],
        ),
      ],
    ),
  );
}

/// Section Widget
Widget _buildApplicationColumn(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  bool isSelectedSwitch2 = false; // Cette variable doit être gérée par un état pour fonctionner correctement

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Theme.of(context).colorScheme.primaryContainer, // Couleur par défaut pour le thème clair
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 2),
        Text(
          "Application",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 7,
              ),
              child: Text(
                "Mode sombre",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            CustomSwitch(
              value: isSelectedSwitch2,
              onChange: (value) {
                isSelectedSwitch2 = value;
                // Ici, vous devez ajouter la logique pour changer le thème de l'application
              },
            )
          ],
        )
      ],
    ),
  );
}

/// Section Widget
Widget _buildTimezoneColumn(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: themeProvider.themeMode == ThemeMode.dark
          ? themeProvider.seedColor // Utilisez la couleur de base pour le thème sombre
          : Theme.of(context).colorScheme.primaryContainer, // Couleur par défaut pour le thème clair
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildVersionRow(
          context,
          versionText: "Fuseau Horaire",
          releaseDate: "France (UTC+2)",
        ),
        const SizedBox(height: 12),
        _buildVersionRow(
          context,
          versionText: "Version",
          releaseDate: "1.02 - Février 2024",
        ),
        const SizedBox(height: 14),
        Text(
          "Vous êtes à jour !",
          style: CustomTextStyles.titleSmallOnPrimaryContainer(context),
        ),
      ],
    ),
  );
}


/// Common widget
Widget _buildVersionRow(BuildContext context, {required String versionText, required String releaseDate}) {
  // Utilisez Theme.of(context) pour accéder aux données de thème actuelles
  final textTheme = Theme.of(context).textTheme;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        versionText,
        style: textTheme.bodyMedium, // Appliquez le style de texte pour le texte de la version
      ),
      Text(
        releaseDate,
        style: textTheme.bodyMedium, // Appliquez le style de texte pour la date de sortie
      ),
    ],
  );
}
