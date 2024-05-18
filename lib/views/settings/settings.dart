import 'package:flutter/material.dart';
import 'core/settings_export.dart';
//import 'widgets/app_bar/appbar_title.dart';
//import 'widgets/app_bar/custom_app_bar.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_switch.dart';
import 'Suggestion/suggestion.dart';
import 'PrivacyPolicy/privacyPolicy.dart';
import 'TermsOfUse/termsOfUse.dart';
// ignore_for_file: must_be_immutable

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: _buildAppBar(context),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildNotificationColumn(context),
              SizedBox(height: 16),
              _buildApplicationColumn(context),
              SizedBox(height: 16),
              _buildTimezoneColumn(context),
              SizedBox(height: 28),
              CustomElevatedButton(
                text: "Conditions d'utilisation",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const TermsOfUse())));
                },
                //title: const Text('Conditions d\'utilisation'),
              ),
              SizedBox(height: 8),
              CustomElevatedButton(
                text: "Politique de confidentialité",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const PrivacyPolicy())));
                },
                //title: const Text('Politique de confidentialité'),
              ),
              SizedBox(height: 8),
              CustomElevatedButton(
                text: "Suggérer une amélioration",
               // buttonStyle: CustomButtonStyles.fillPrimary,
                //buttonTextStyle: theme.textTheme.titleSmall!,
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
 
  /**PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppBarTitle(
        text: "Paramètres",
      ),
      styleType: Style.bgFill,
    );
  }**/
}


/// Section Widget
Widget _buildNotificationColumn(BuildContext context) {
  bool isSelectedSwitch = false;
  bool isSelectedSwitch1 = false;

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    decoration: AppDecoration.fillPrimaryContainer.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder16,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 2),
        Text(
          "Notifications",
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nouvelle semaine",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 7),
                  SizedBox(
                    width: 259,
                    child: Text(
                      "Je souhaite être notifié quand une ou plusieurs semaines de cours sont ajoutées aux emplois du temps de mes groupes suivis",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSwitch(
              margin: EdgeInsets.only(
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
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Modifications",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 7),
                  SizedBox(
                    width: 270,
                    child: Text(
                      "Je souhaite être notifié quand mes emplois du temps suivis subissent des modifications (ajout de cours, modification de salle, annulation, ...)",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSwitch(
              margin: EdgeInsets.only(
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
  bool isSelectedSwitch2 = false;
  return Container(
    padding: EdgeInsets.all(16),
    decoration: AppDecoration.fillPrimaryContainer.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder16,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 2),
        Text(
          "Application",
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 7,
              ),
              child: Text(
                "Mode sombre",
                style: theme.textTheme.titleMedium,
              ),
            ),
            CustomSwitch(
              value: isSelectedSwitch2,
              onChange: (value) {
                isSelectedSwitch2 = value;
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
  return Container(
    padding: EdgeInsets.all(16),
    decoration: AppDecoration.fillPrimaryContainer.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder16,
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
        SizedBox(height: 12),
        _buildVersionRow(
          context,
          versionText: "Version",
          releaseDate: "1.02 - Février 2024",
        ),
        SizedBox(height: 14),
        Text(
          "Vous êtes à jour !",
          style: CustomTextStyles.titleSmallOnPrimaryContainer,
        ),
      ],
    ),
  );
}

/// Common widget
Widget _buildVersionRow(
  BuildContext context, {
  required String versionText,
  required String releaseDate,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        versionText,
        style: theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        ),
      ),
      Text(
        releaseDate,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        ),
      )
    ],
  );
}
