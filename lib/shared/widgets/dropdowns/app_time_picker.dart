import 'package:flutter/material.dart';

class AppTimePicker {
  static Future<TimeOfDay?> show({
    required BuildContext context,
    TimeOfDay? initialTime,
  }) {
    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
  }
}
