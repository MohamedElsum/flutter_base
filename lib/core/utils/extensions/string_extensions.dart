extension StringExtensions on String {
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String get capitalizeWords =>
      split(' ').map((w) => w.capitalize).join(' ');

  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isNumeric => double.tryParse(this) != null;

  bool get isPhoneNumber =>
      RegExp(r'^\+?[\d\s-]{9,15}$').hasMatch(this);

  bool get isUrl => Uri.tryParse(this)?.hasScheme ?? false;

  String truncate(int maxLength, {String suffix = '...'}) =>
      length <= maxLength ? this : '${substring(0, maxLength - suffix.length)}$suffix';

  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  String get toSnakeCase =>
      replaceAllMapped(RegExp(r'[A-Z]'), (m) => '_${m[0]!.toLowerCase()}')
          .replaceFirst(RegExp(r'^_'), '');

  String get toCamelCase {
    final words = split(RegExp(r'[_\s-]+'));
    return words.first.toLowerCase() +
        words.skip(1).map((w) => w.capitalize).join();
  }

  int? get toIntOrNull => int.tryParse(this);
  double? get toDoubleOrNull => double.tryParse(this);
}
