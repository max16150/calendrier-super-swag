import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_floating_text_field.dart';

// ignore_for_file: must_be_immutable
class Suggestion extends StatelessWidget {
  Suggestion({Key? key}) : super(key: key);

  TextEditingController recipientController = TextEditingController();
  TextEditingController senderController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Accédez au ThemeProvider à l'aide de Provider.of
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Suggestion'),
          centerTitle: true,
          backgroundColor: themeProvider
              .seedColor, // Utilisez la couleur de base pour la barre d'applications
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: 412,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 17,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 380,
                      child: Text(
                        "Pour suggérer une amélioration de l’application, déclarer un bug ou un problème, vous pouvez passer par le formulaire suivant ou directement en nous envoyant un mail à l’adresse : contact@3ilab.fr",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: themeProvider.themeMode == ThemeMode.dark
                              ? Colors
                                  .white // Vous pouvez choisir une couleur appropriée pour le texte en mode sombre
                              : Colors
                                  .black, // Et une couleur appropriée pour le texte en mode clair
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                      color: themeProvider
                          .seedColor, // Utilisez la couleur de base pour le séparateur
                    ),
                    SizedBox(height: 7),
                    _buildRecipient(context),
                    SizedBox(height: 8),
                    _buildSender(context),
                    SizedBox(height: 8),
                    _buildSubject(context),
                    SizedBox(height: 8),
                    _buildContent(context),
                    SizedBox(height: 5)
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildEnvoyer(context),
      ),
    );
  }

  // Les méthodes _buildRecipient, _buildSender, _buildSubject, _buildContent et _buildEnvoyer doivent également être ajustées
  // pour utiliser le themeProvider pour définir les styles et les couleurs en fonction du thème actuel.
  Widget _buildRecipient(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomFloatingTextField(
      controller: recipientController,
      labelText: "Destinataire",
      labelStyle: themeProvider.themeMode == ThemeMode.dark
          ? CustomTextStyles.bodyLargeOnPrimaryContainer(context).copyWith(
              color: themeProvider
                  .seedColor, // Utilisez la couleur de base pour le texte en mode sombre
            )
          : CustomTextStyles.bodyLargeOnPrimaryContainer(context),
      hintText: "Destinataire",
      hintStyle: CustomTextStyles.bodyLargeOnPrimaryContainer(context),
    );
  }

  Widget _buildSender(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomFloatingTextField(
      controller: senderController,
      labelText: "Emetteur",
      labelStyle: themeProvider.themeMode == ThemeMode.dark
          ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: themeProvider
                    .seedColor, // Utilisez la couleur de base pour le texte en mode sombre
              )
          : Theme.of(context).textTheme.bodyLarge!,
      hintText: "Emetteur",
    );
  }

  Widget _buildSubject(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomFloatingTextField(
      controller: subjectController,
      labelText: "Objet",
      labelStyle: themeProvider.themeMode == ThemeMode.dark
          ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: themeProvider
                    .seedColor, // Utilisez la couleur de base pour le texte en mode sombre
              )
          : Theme.of(context).textTheme.bodyLarge!,
      hintText: "Objet",
    );
  }

  Widget _buildContent(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomFloatingTextField(
      controller: contentController,
      labelText: "Contenu",
      labelStyle: themeProvider.themeMode == ThemeMode.dark
          ? CustomTextStyles.bodyMediumGray400(context).copyWith(
              color: themeProvider.seedColor.withOpacity(
                  0.6), // Utilisez la couleur de base avec opacité pour le texte en mode sombre
            )
          : CustomTextStyles.bodyMediumGray400(context),
      hintText: "Contenu",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 158),
    );
  }

  Widget _buildEnvoyer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomElevatedButton(
      text: "Envoyer",
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      leftIcon: const Icon(Icons.send),
      buttonStyle: CustomButtonStyles.fillPrimary(context),
      buttonTextStyle: TextStyle(
        color: themeProvider.themeMode == ThemeMode.dark
            ? Colors
                .white // Utilisez la couleur blanche pour le texte en mode sombre
            : Colors
                .black, // Utilisez la couleur noire pour le texte en mode clair
        fontSize: Theme.of(context)
            .textTheme
            .titleSmall!
            .fontSize, // Gardez la taille de police originale
        fontWeight: Theme.of(context)
            .textTheme
            .titleSmall!
            .fontWeight, // Gardez le poids de la police originale
      ),
      onTap: () {
        // Logique d'envoi ici
      },
    );
  }
}
