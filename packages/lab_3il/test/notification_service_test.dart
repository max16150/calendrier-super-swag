import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_3il/lab_3il.dart';

void main() {
  group('NotificationService integration tests', () {
    late final Lab3il lab3il;

    setUpAll(() async {
      lab3il = await Lab3il.initialize(
        client: Dio(BaseOptions(baseUrl: 'http://localhost/api/v1')),
      );
    });

    test('getNotifications', () async {
      final notifications = await lab3il.notificationsService.getNotifications(
        groupIds: [1, 2, 3],
        limit: 10,
        offset: 0,
      );
      expect(notifications, isA<List<AppNotification>>());
      debugPrint(notifications.toString());
    });

    test('getLastNotificationsDate', () async {
      final lastNotificationsDate = await lab3il.notificationsService.getLastNotificationsDate();
      expect(lastNotificationsDate, isA<Map<int, DateTime>>());
      debugPrint(lastNotificationsDate.toString());
    });
  });
}
