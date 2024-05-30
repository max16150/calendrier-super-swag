import 'package:flutter_test/flutter_test.dart';
import 'package:lab_3il/lab_3il.dart';

void main() {
  group('SuggestionService integration tests', () {
    late final Lab3il lab3il;

    setUpAll(() async {
      lab3il = await Lab3il.initialize(
        apiRoute: 'https://3ilab.fr/api/v1',
      );
    });

    test('postSuggestion', () async {
      const suggestion = Suggestion(
        mail: 'test@test.com',
        content: 'This is a test suggestion',
      );
      await lab3il.suggestionsService.postSuggestion(suggestion: suggestion);
    });
  });
}
