import 'package:dio/dio.dart';

enum ApiErrorType implements Exception {
  auth,
  notFound,
  client,
  server,
  network;
}

class ApiError implements Exception {
  final ApiErrorType type;
  final String message;

  ApiError._(this.type, {this.message = ''});

  factory ApiError.fromException(dynamic e) {
    if (e is DioException) {
      final statusCode = (e.response?.statusCode ?? 0);
      final message = e.response?.statusMessage ?? '';
      switch (e.type) {
        case DioExceptionType.badResponse:
          if (statusCode >= 500) {
            return ApiError._(ApiErrorType.server, message: message);
          } else if (statusCode >= 404) {
            return ApiError._(ApiErrorType.notFound, message: message);
          } else if (statusCode >= 401) {
            return ApiError._(ApiErrorType.auth, message: message);
          }
          return ApiError._(ApiErrorType.client, message: message);
        default:
          return ApiError._(ApiErrorType.network, message: message);
      }
    } else {
      return ApiError._(ApiErrorType.client);
    }
  }
}
