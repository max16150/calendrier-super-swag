part of '../lab_3il.dart';

class SuggestionService {
  final Lab3il _lab3il;
  Dio get _client => _lab3il._client;

  SuggestionService(this._lab3il);

  /// Post a new suggestion.
  Future<void> postSuggestion({
    required Suggestion suggestion,
  }) async {
    try {
      await _client.post(
        '/suggestions',
        data: suggestion.toJson(),
      );
    } catch (e) {
      throw ApiError.fromException(e);
    }
  }
}
