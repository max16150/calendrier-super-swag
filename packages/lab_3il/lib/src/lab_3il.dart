import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:lab_3il/lab_3il.dart';

part 'services/agenda_service.dart';
part 'services/information_service.dart';
part 'services/notification_service.dart';
part 'services/suggestion_service.dart';

class Lab3il {
  final String apiRoute = const String.fromEnvironment('API_ROUTE');

  late final AgendaService agendaService;
  late final InformationService informationsService;
  late final NotificationService notificationsService;
  late final SuggestionService suggestionsService;
  late final Dio _client;

  //private constructor
  Lab3il._({
    required Dio client,
  }) {
    _client = client;
    agendaService = AgendaService(this);
    informationsService = InformationService(this);
    notificationsService = NotificationService(this);
    suggestionsService = SuggestionService(this);
  }

  set acceptLanguage(String language) => _client.options.headers['Accept-Language'] = language;

  static Future<Lab3il> initialize({
    required String apiRoute,
    Dio? client,
    String? acceptLanguage,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    final clt = client ?? Dio(BaseOptions(baseUrl: apiRoute));
    final lab = Lab3il._(client: clt);
    lab.acceptLanguage = acceptLanguage ?? Intl.systemLocale;
    return lab;
  }
}
