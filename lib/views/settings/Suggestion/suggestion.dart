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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Suggestion'),
          centerTitle: true,
          backgroundColor: themeProvider.seedColor,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  width: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
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
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: themeProvider.seedColor,
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
            );
          },
        ),
        bottomNavigationBar: _buildEnvoyer(context),
      ),
    );
  }

  Widget _buildRecipient(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomFloatingTextField(
      controller: recipientController,
      labelText: "Destinataire",
      labelStyle: themeProvider.themeMode == ThemeMode.dark
          ? CustomTextStyles.bodyMediumGray400(context).copyWith(
              color: themeProvider.themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
            )
          : CustomTextStyles.bodyMediumGray400(context),
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
          ? CustomTextStyles.bodyMediumGray400(context).copyWith(
              color: themeProvider.themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
            )
          : CustomTextStyles.bodyMediumGray400(context),
      hintText: "Emetteur",
    );
  }

  Widget _buildSubject(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomFloatingTextField(
      controller: subjectController,
      labelText: "Objet",
      labelStyle: themeProvider.themeMode == ThemeMode.dark
          ? CustomTextStyles.bodyMediumGray400(context).copyWith(
              color: themeProvider.themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
            )
          : CustomTextStyles.bodyMediumGray400(context),
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
              color: themeProvider.themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
            )
          : CustomTextStyles.bodyMediumGray400(context),
      hintText: "Contenu",
      //textInputAction: TextInputAction.done,
      //textInputType: TextInputType.visiblePassword,
      //obscureText: true,
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
      leftIcon: Icon(
        Icons.send,
        color: themeProvider.themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black, // Utilisez la couleur primaire du thème actuel
      ),
      buttonStyle: CustomButtonStyles.fillPrimary(context),
      buttonTextStyle: TextStyle(
        color: themeProvider.themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
        fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight,
      ),
      onTap: () {
        // Logique d'envoi ici
      },
    );
  }
}
