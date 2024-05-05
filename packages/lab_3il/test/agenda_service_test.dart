import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_3il/lab_3il.dart';

void main() {
  group('AgendaService integration tests', () {
    late final Lab3il lab3il;

    setUpAll(() async {
      lab3il = await Lab3il.initialize(
        client: Dio(BaseOptions(baseUrl: 'http://localhost/api/v1')),
      );
    });

    test('getAgenda', () async {
      final start = DateTime.now();
      final end = start.add(const Duration(days: 7));
      final agenda = await lab3il.agendaService.getAgenda(
        groupId: '1',
        start: start,
        end: end,
      );

      expect(agenda, isA<Agenda>());
      debugPrint(agenda.toString());
    });

    /*
    test('downloadAgenda', () async {
      final start = DateTime.now();
      final end = start.add(const Duration(days: 7));
      final path = 'agenda.ics';
      await lab3il.agendaService.downloadAgenda(
        groupId: '1',
        start: start,
        end: end,
        path: path,
      );

      final file = File(path);
      expect(await file.exists(), isTrue);
      await file.delete();
    });
    */

    test('updateAgenda', () async {
      await lab3il.agendaService.updateAgenda(groupId: 0);
    });
  });
}
