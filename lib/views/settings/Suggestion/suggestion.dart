import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lab_3il/lab_3il.dart' as lab;
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';

class Suggestion extends StatelessWidget {
  Suggestion({super.key});

  final TextEditingController senderController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Future<void> _onSendSuggestion(BuildContext context) async {
    final lab.Lab3il lab3il = context.read<lab.Lab3il>();
    final lab.Suggestion suggestion = lab.Suggestion(
      mail: senderController.text,
      content: '/subject: ${subjectController.text}   /content: ${contentController.text}',
    );

    try {
      await lab3il.suggestionsService.postSuggestion(suggestion: suggestion);
    } catch (e) {
      if (!context.mounted) return;
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(context.tr('error_occured')),
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }

    if (!context.mounted) return;

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(context.tr('suggestion_sent')),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('suggestion')),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      context.tr('suggestion_description'),
                      style: context.textTheme.bodyMedium,
                    ),
                    const Gap(16),
                    const Divider(height: 0, indent: 16, endIndent: 16),
                    const Gap(16),
                    TextField(
                      enabled: false,
                      controller: TextEditingController()..text = 'contact@3ilab.fr',
                      decoration: InputDecoration(
                        labelText: context.tr('recipient'),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const Gap(16),
                    TextField(
                      controller: senderController,
                      decoration: InputDecoration(
                        labelText: context.tr('sender'),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const Gap(16),
                    TextField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        labelText: context.tr('subject'),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const Gap(16),
                    TextField(
                      controller: contentController,
                      decoration: InputDecoration(
                        labelText: context.tr('message'),
                        border: const OutlineInputBorder(),
                      ),
                      minLines: 5,
                      maxLines: 10,
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: FilledButton.icon(
                        onPressed: () => _onSendSuggestion(context),
                        icon: const Icon(Icons.send),
                        label: Text(context.tr('send')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
