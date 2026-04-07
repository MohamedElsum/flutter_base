import 'package:dio/dio.dart';
import 'package:flutter_base/core/error/exceptions.dart';
import 'package:flutter_base/core/storage/hive_storage.dart';
import 'package:flutter_base/core/storage/storage_keys.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = HiveStorage.get<String>(StorageKeys.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const NetworkException(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        throw const NetworkException();
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final message = _extractMessage(err.response);
        throw ServerException(message: message, statusCode: statusCode);
      default:
        throw ServerException(message: err.message ?? 'Unknown error');
    }
  }

  String _extractMessage(Response? response) {
    try {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        return data['message'] as String? ?? 'Server error';
      }
      return 'Server error';
    } catch (_) {
      return 'Server error';
    }
  }
}
