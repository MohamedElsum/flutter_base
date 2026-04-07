import 'dart:math';

extension NumExtensions on num {
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());

  String toCurrency({String symbol = '\$', int decimalDigits = 2}) {
    final parts = toStringAsFixed(decimalDigits).split('.');
    final intPart = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '$symbol$intPart.${parts[1]}';
  }

  String toFileSize({int decimals = 1}) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    if (this == 0) return '0 B';
    final i = (log(this) / log(1024)).floor().clamp(0, suffixes.length - 1);
    final size = this / pow(1024, i);
    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  String get ordinal {
    final n = toInt();
    if (n % 100 >= 11 && n % 100 <= 13) return '${n}th';
    return switch (n % 10) {
      1 => '${n}st',
      2 => '${n}nd',
      3 => '${n}rd',
      _ => '${n}th',
    };
  }

  bool isBetween(num min, num max) => this >= min && this <= max;
}
