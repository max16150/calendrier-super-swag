import 'package:flutter/material.dart';
import 'package:triilab/extension.dart';

import 'Suggestion/suggestion.dart';
import 'PrivacyPolicy/privacyPolicy.dart';
import 'TermsOfUse/termsOfUse.dart';

// Classe pour les paramètres de l'application
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        children: [
          // Section des notifications
          SettingsSection(
            title: const Text('Notifications'),
            tiles: [
              SwitchListTile(
                title: const Text('Nouvelle semaine'),
                value: true, // Pour remplacer par la valeur réelle des préférences partagées
                onChanged: (bool value) {
                  // Pour mettre à jour la valeur dans les préférences partagées
                },
              ),
              SwitchListTile(
                title: const Text('Modifications'),
                value: false, //Pour remplacer par la valeur réelle des préférences partagées
                onChanged: (bool value) {
                  //Pour mettre à jour la valeur dans les préférences partagées
                },
              ),
            ],
          ),

          // Section de l'application
          SettingsSection(
            title: const Text('Application'),
            tiles: [
              ListTile(
                title: const Text('Mode sombre'),
                trailing: Switch(
                  value: false, // Pour remplacer par la valeur réelle des préférences partagées
                  onChanged: (bool value) {
                    // Pour mettre à jour la valeur dans les préférences partagées
                  },
                ),
              ),
              ListTile(
                title: const Text('Fuseau horaire'),
                trailing: Text('France (UTC+2)'),
              ),
              ListTile(
                title: const Text('Version'),
                trailing: Text('1.02-Février 2024'),
              ),
            ],
          ),

          // Section légale
          SettingsSection(
            title: const Text('Légal'),
            tiles: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) =>  TermsOfUse())
                  ));
                },
                title: const Text('Conditions d\'utilisation'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) =>  PrivacyPolicy())
                  ));
                },
                title: const Text('Politique de confidentialité'),
              ),
            ],
          ),

          // Section des retours
          ListTile(
            title: const Text('Suggérer une amélioration'),
            onTap: () {
              Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) =>  Suggestion())
                  ));
            },
          ),
        ],
      ),
    );
  }
}

// Widget pour la section des paramètres
class SettingsSection extends StatelessWidget {
  const SettingsSection({
    required this.title,
    required this.tiles,
  });

  final Widget title;
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(height: 8.0),
          Divider(color: Colors.grey[200]),
          ...tiles,
        ],
      ),
    );
  }
}

// Widget pour le titre des paramètres
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.title,
    this.trailing,
    this.onTap,
  });

  final Widget title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
