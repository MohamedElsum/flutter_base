import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }

  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }

  String get toHex {
    final argb = toARGB32();
    return '#${(argb & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }

  Color get complementary {
    final hsl = HSLColor.fromColor(this);
    return hsl.withHue((hsl.hue + 180) % 360).toColor();
  }

  Color withOpacityValue(double opacity) =>
      Color.fromRGBO(
        (r * 255.0).round().clamp(0, 255),
        (g * 255.0).round().clamp(0, 255),
        (b * 255.0).round().clamp(0, 255),
        opacity,
      );
}
