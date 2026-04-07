import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class ErrorHandler {
  static final Logger _logger = Logger();

  static void init() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      _logger.e('FlutterError', error: details.exception, stackTrace: details.stack);
    };
  }

  static void handleError(Object error, StackTrace stackTrace) {
    _logger.e('Unhandled error', error: error, stackTrace: stackTrace);
  }
}
