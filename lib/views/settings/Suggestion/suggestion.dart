import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Suggestion'),
          centerTitle: true,
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
                        style: theme.textTheme.bodyMedium!.copyWith(
                          height: 1.43,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Divider(
                      indent: 16,
                      endIndent: 16,
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

  Widget _buildRecipient(BuildContext context) {
    return CustomFloatingTextField(
      controller: recipientController,
      labelText: "Destinataire",
      labelStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
      hintText: "Destinataire",
      hintStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
    );
  }

  Widget _buildSender(BuildContext context) {
    return CustomFloatingTextField(
      controller: senderController,
      labelText: "Emetteur",
      labelStyle: theme.textTheme.bodyLarge!,
      hintText: "Emetteur",
    );
  }

  Widget _buildSubject(BuildContext context) {
    return CustomFloatingTextField(
      controller: subjectController,
      labelText: "Objet",
      labelStyle: theme.textTheme.bodyLarge!,
      hintText: "Objet",
    );
  }

  Widget _buildContent(BuildContext context) {
    return CustomFloatingTextField(
      controller: contentController,
      labelText: "Contenu",
      labelStyle: CustomTextStyles.bodyMediumGray400,
      hintText: "Contenu",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 158),
    );
  }

 Widget _buildEnvoyer(BuildContext context) {
  return CustomElevatedButton(
    text: "Envoyer",
    margin: EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 16,
    ),
    leftIcon: const Icon(Icons.send),
    buttonStyle: CustomButtonStyles.fillPrimary,
    buttonTextStyle: theme.textTheme.titleSmall!,
    onTap: () {  },
  );
}

}
