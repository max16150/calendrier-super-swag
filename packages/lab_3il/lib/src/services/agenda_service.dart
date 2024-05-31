part of '../lab_3il.dart';

class AgendaService {
  final Lab3il _lab3il;
  Dio get _client => _lab3il._client;

  AgendaService(this._lab3il);

  /// Get the agenda of a group for a specific period.
  Future<Agenda> getAgenda({
    required String groupId,
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      final response = await _client.get(
        '/agenda/$groupId',
        queryParameters: {
          'start': start.toUtc().toIso8601String(),
          'end': end.toUtc().toIso8601String(),
        },
      );

      return Agenda.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Download the ics agenda for the given group and save it to a file.
  Future<void> downloadAgenda({
    required String groupId,
    required DateTime start,
    required DateTime end,
    required String path,
  }) async {
    try {
      final response = await _client.get(
        '/agenda/$groupId',
        queryParameters: {
          'start': start.toIso8601String(),
          'end': end.toIso8601String(),
        },
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        await File(path).writeAsBytes(response.data as List<int>);
      } else {
        throw Exception('Failed to download agenda');
      }
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Update the agenda of a group.
  Future<void> updateAgenda({
    required int groupId,
  }) async {
    try {
      await _client.post(
        '/update/$groupId',
      );
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }
}
