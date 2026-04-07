import 'dart:async';

extension FutureExtensions<T> on Future<T> {
  Future<T> withTimeout(Duration duration, {T Function()? onTimeout}) =>
      timeout(duration, onTimeout: onTimeout != null ? () => onTimeout() : null);

  Future<T> retry({int maxAttempts = 3, Duration delay = const Duration(seconds: 1)}) async {
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        return await this;
      } catch (e) {
        if (attempt == maxAttempts) rethrow;
        await Future.delayed(delay * attempt);
      }
    }
    throw Exception('Retry failed after $maxAttempts attempts');
  }
}

class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({this.duration = const Duration(milliseconds: 300)});

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void dispose() => _timer?.cancel();
}
