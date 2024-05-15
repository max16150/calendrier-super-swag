part of '../lab_3il.dart';

class InformationService {
  final Lab3il _lab3il;
  Dio get _client => _lab3il._client;

  InformationService(this._lab3il);

  /// Get the last version number of the application.
  Future<AppVersion> getLastAppVersion() async {
    try {
      final response = await _client.get(
        '/app-version',
      );

      return AppVersion.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Get general informations
  Future<Informations> getInformations() async {
    try {
      final response = await _client.get(
        '/informations',
      );

      return Informations.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Get groups that finish their courses at 12:00
  Future<List<GroupBreakInformation>> getLaunchBreak({required DateTime date}) async {
    try {
      final response = await _client.get(
        '/launch-break',
        queryParameters: {
          'date': DateFormat('yyyy-MM-dd').format(date.toUtc()),
        },
      );

      return response.data.map((e) => GroupBreakInformation.fromJson(e)).toList().cast<GroupBreakInformation>();
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Get groups that finish their courses at 10:00
  Future<List<GroupBreakInformation>> getMorningBreak({required DateTime date}) async {
    try {
      final response = await _client.get(
        '/morning-break',
        queryParameters: {
          'date': DateFormat('yyyy-MM-dd').format(date.toUtc()),
        },
      );

      return response.data.map((e) => GroupBreakInformation.fromJson(e)).toList().cast<GroupBreakInformation>();
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Get the privacy policy
  Future<PrivacyPolicy> getPrivacyPolicy() async {
    try {
      final response = await _client.get(
        '/privacy-policy',
      );

      return PrivacyPolicy.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// Get the gcu
  Future<Gcu> getGcu() async {
    try {
      final response = await _client.get(
        '/gcu',
      );

      return Gcu.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }

  /// List all the saved groups
  Future<List<ClassGroup>> getSavedGroups() async {
    try {
      final response = await _client.get(
        '/groups',
      );

      return response.data.map((e) => ClassGroup.fromJson(e)).toList().cast<ClassGroup>();
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }
}
