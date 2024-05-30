import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/providers/agenda_provider.dart';
import 'package:triilab/views/agenda/agenda_selection.dart';
import 'package:triilab/views/agenda/agenda_view.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AgendaProvider>(
        builder: (context, agendaProvider, _) {
          final group = agendaProvider.selectedGroup;
          if (group == null) {
            return const AgendaSelection();
          } else {
            return AgendaView(
              key: ValueKey(group.id),
              selectedGroup: group,
            );
          }
        },
      ),
    );
  }
}
