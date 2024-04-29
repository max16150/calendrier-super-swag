import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:triilab/services/translation_service.dart';

extension AppContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

extension TranslationServiceExtension on BuildContext {
  String tr(String key) {
    return Localizations.of<TranslationService>(this, TranslationService)!.translate(key);
  }

  Future<void> changeLocale(Locale locale) async {
    if (!TranslationService.supportedLanguages.contains(locale)) return;
    Intl.defaultLocale = locale.toLanguageTag();
    read<TranslationProvider>().update();
  }
}
