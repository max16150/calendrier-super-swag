import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:triilab/providers/agenda_provider.dart';

class AgendaSelectionDialog extends StatefulWidget {
  const AgendaSelectionDialog({super.key});

  @override
  State<AgendaSelectionDialog> createState() => _AgendaSelectionDialogState();
}

class _AgendaSelectionDialogState extends State<AgendaSelectionDialog> {
  late ValueNotifier<ClassGroup?> selectedGroupNotifier;

  @override
  void initState() {
    super.initState();
    final selectedGroup = context.read<AgendaProvider>().selectedGroup;
    selectedGroupNotifier = ValueNotifier<ClassGroup?>(selectedGroup);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Annuler'),
        ),
        ValueListenableBuilder<ClassGroup?>(
          valueListenable: selectedGroupNotifier,
          builder: (context, selectedGroup, _) => TextButton(
            onPressed: selectedGroup == null
                ? null
                : () {
                    context.read<AgendaProvider>().setSelectedGroup(selectedGroup);
                    Navigator.of(context).pop();
                  },
            child: const Text('Valider'),
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: FutureBuilder<List<ClassGroup>>(
          future: context.read<Lab3il>().informationsService.getSavedGroups(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              final ApiError error = snapshot.error as ApiError;
              return Center(
                child: Text('Erreur: ${error.type}'),
              );
            }

            final groups = snapshot.data as List<ClassGroup>;
            groups.sort((a, b) => a.name.compareTo(b.name));

            return StatefulBuilder(
              builder: (context, setState) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (final group in groups)
                    RadioListTile<ClassGroup>(
                      contentPadding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      dense: true,
                      title: Text(group.name),
                      value: group,
                      groupValue: selectedGroupNotifier.value,
                      onChanged: (value) => setState(() => selectedGroupNotifier.value = value),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
