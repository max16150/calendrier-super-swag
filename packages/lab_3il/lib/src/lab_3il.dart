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
    Dio? client,
  }) {
    _client = client ?? Dio(BaseOptions(baseUrl: apiRoute));
    agendaService = AgendaService(this);
    informationsService = InformationService(this);
    notificationsService = NotificationService(this);
    suggestionsService = SuggestionService(this);
  }

  set acceptLanguage(String language) => _client.options.headers['Accept-Language'] = language;

  static Future<Lab3il> initialize({
    Dio? client,
    String? acceptLanguage,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    final lab = Lab3il._(client: client);
    lab.acceptLanguage = acceptLanguage ?? Platform.localeName;
    return lab;
  }
}
