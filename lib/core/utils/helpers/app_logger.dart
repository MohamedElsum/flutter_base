import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
    ),
  );

  static void debug(dynamic message) {
    if (kDebugMode) _logger.d(message);
  }

  static void info(dynamic message) {
    if (kDebugMode) _logger.i(message);
  }

  static void warning(dynamic message) {
    if (kDebugMode) _logger.w(message);
  }

  static void error(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
