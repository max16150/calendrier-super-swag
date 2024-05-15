part of '../lab_3il.dart';

class NotificationService {
  final Lab3il _lab3il;
  Dio get _client => _lab3il._client;

  NotificationService(this._lab3il);

  /// Get notifications for the specified groups
  Future<List<AppNotification>> getNotifications({
    required List<int> groupIds,
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _client.get(
        '/notifications',
        queryParameters: {
          'groupIds': groupIds,
          'limit': limit,
          'offset': offset,
        },
      );

      return (response.data as List).map((e) => AppNotification.fromJson(e)).toList().cast<AppNotification>();
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Get the last notifications date for each groups
  Future<Map<int, DateTime>> getLastNotificationsDate() async {
    try {
      final response = await _client.get(
        '/last-notifications-date',
      );

      return Map.fromEntries((response.data as List).map((e) {
        final groupId = e['group_id'];
        final lastNotificationDate = DateTime.parse(e['last_notification_date']);
        return MapEntry(groupId, lastNotificationDate);
      }));
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }
}
