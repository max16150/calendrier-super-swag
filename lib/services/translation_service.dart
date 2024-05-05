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

  String translate(String key) {
    return _translations[key] ?? key;
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
