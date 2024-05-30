import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:triilab/services/translation_service.dart';

extension AppContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension TranslationServiceExtension on BuildContext {
  String tr(String key, {Map args = const {}, int? count = 1}) {
    return Localizations.of<TranslationService>(this, TranslationService)!.translate(key, args: args, count: count);
  }

  Future<void> changeLocale(Locale locale) async {
    if (!TranslationService.supportedLanguages.contains(locale)) return;
    Intl.defaultLocale = locale.toLanguageTag();
    read<TranslationProvider>().update();
  }
}
