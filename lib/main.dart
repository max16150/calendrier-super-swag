import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:triilab/firebase_options.dart';
import 'package:triilab/providers/fullscreen_provider.dart';
import 'package:triilab/services/storage_service.dart';
import 'package:triilab/services/translation_service.dart';

import 'providers/theme_provider.dart';
import 'views/navigation.dart';

void main() async {
  // Encapsulate the entire app in a runZonedGuarded to catch any uncaught errors
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final Lab3il lab = await Lab3il.initialize(
      apiRoute: const String.fromEnvironment('LAB_API_ROUTE'),
    );

    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    ThemeProvider themeProvider = await ThemeProvider.create();
    Intl.defaultLocale = await StorageService().getLanguageCode() ?? 'fr';

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: themeProvider),
          ChangeNotifierProvider(create: (context) => TranslationProvider()),
          Provider.value(value: lab),
          ChangeNotifierProvider(create: (context) => FullscreenProvider()),
        ],
        child: const MyApp(),
      ),
    );
  }, (error, stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Provider.of<TranslationProvider>(context);

    return MaterialApp(
      title: '3iLab',
      locale: Locale(Intl.getCurrentLocale()),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        TranslationService.delegate,
      ],
      supportedLocales: TranslationService.supportedLanguages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeProvider.seedColor, brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeProvider.seedColor, brightness: Brightness.dark),
      ),
      home: const Navigation(),
      themeMode: themeProvider.themeMode,
    );
  }
}
