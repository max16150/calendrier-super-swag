import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triilab/services/storage_service.dart';
import 'package:yaml/yaml.dart';

class TranslationService {
  YamlMap _translations = YamlMap();

  static const LocalizationsDelegate<TranslationService> delegate = TranslationDelegate();

  static const Iterable<Locale> supportedLanguages = [
    Locale('en'),
    Locale('fr'),
  ];

  String translate(String key, {Map args = const {}, int? count = 1}) {
    String message = key;

    if (_translations.containsKey(key)) {
      final value = _translations[key];
      if (value is String) {
        message = value;
      } else if (value is YamlMap) {
        if (count == 0 && value.containsKey('zero')) {
          message = value['zero'] as String? ?? key;
        } else if (count == 1 && value.containsKey('one')) {
          message = value['one'] as String? ?? key;
        } else if (count != null) {
          message = value['more'] as String? ?? key;
        }
        message = message.replaceAll(RegExp('{count}'), '$count');
      }

      args.forEach((key, value) {
        message = message.replaceAll(RegExp('{$key}'), '$value');
      });
    }

    return message;
  }

  Future<void> load(String languageCode) async {
    final translations = await rootBundle.loadString('assets/translations/messages-$languageCode.yaml');
    _translations = loadYaml(translations);
    StorageService().saveLanguageCode(languageCode);
  }
}

class TranslationDelegate extends LocalizationsDelegate<TranslationService> {
  const TranslationDelegate();

  @override
  bool isSupported(Locale locale) {
    return TranslationService.supportedLanguages.contains(locale);
  }

  @override
  Future<TranslationService> load(Locale locale) async {
    TranslationService translationService = TranslationService();
    await translationService.load(locale.languageCode);

    return translationService;
  }

  @override
  bool shouldReload(TranslationDelegate old) => false;
}

class TranslationProvider extends ChangeNotifier {
  void update() {
    notifyListeners();
  }

  TranslationProvider();
}
