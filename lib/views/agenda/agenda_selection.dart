import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/views/agenda/agenda_selection_dialog.dart';

class AgendaSelection extends StatelessWidget {
  const AgendaSelection({super.key});

  void _openSelectDialog(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => const AgendaSelectionDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_today),
              const Gap(8),
              Text(
                context.tr('select_agenda'),
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () => _openSelectDialog(context),
                      child: Text(context.tr('select')),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
