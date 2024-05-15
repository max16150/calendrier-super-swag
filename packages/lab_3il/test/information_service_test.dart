import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_3il/lab_3il.dart';

void main() {
  group('InformationService integration tests', () {
    late final Lab3il lab3il;

    setUpAll(() async {
      lab3il = await Lab3il.initialize(
        //client: Dio(BaseOptions(baseUrl: 'http://localhost/api/v1')),
        client: Dio(BaseOptions(baseUrl: 'https://3ilab.fr/api/v1')),
      );
    });

    test('getLastAppVersion', () async {
      final appVersion = await lab3il.informationsService.getLastAppVersion();

      expect(appVersion, isA<AppVersion>());
      debugPrint(appVersion.toString());
    });

    test('getInformations', () async {
      final information = await lab3il.informationsService.getInformations();

      expect(information, isA<Informations>());
      debugPrint(information.toString());
    });

    test('getLaunchBreak', () async {
      final launchBreak = await lab3il.informationsService.getLaunchBreak(
        date: DateTime.now(),
      );

      expect(launchBreak, isA<List<GroupBreakInformation>>());
      debugPrint(launchBreak.toString());
    });

    test('getMorningBreak', () async {
      final morningBreak = await lab3il.informationsService.getMorningBreak(
        date: DateTime.now(),
      );

      expect(morningBreak, isA<List<GroupBreakInformation>>());
      debugPrint(morningBreak.toString());
    });

    test('getPrivacyPolicy', () async {
      final privacyPolicy = await lab3il.informationsService.getPrivacyPolicy();

      expect(privacyPolicy, isA<PrivacyPolicy>());
      debugPrint(privacyPolicy.toString());
    });

    test('getGcu', () async {
      final gcu = await lab3il.informationsService.getGcu();

      expect(gcu, isA<Gcu>());
      debugPrint(gcu.toString());
    });

    test('getSavedGroups', () async {
      final savedGroups = await lab3il.informationsService.getSavedGroups();

      expect(savedGroups, isA<List<ClassGroup>>());
      debugPrint(savedGroups.toString());
    });
  });
}
