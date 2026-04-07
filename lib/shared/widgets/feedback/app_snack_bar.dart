import 'package:flutter/material.dart';
import 'package:flutter_base/core/theme/app_colors.dart';

class AppSnackBar {
  static void success(BuildContext context, String message) =>
      _show(context, message, AppColors.success, Icons.check_circle);

  static void error(BuildContext context, String message) =>
      _show(context, message, AppColors.error, Icons.error);

  static void info(BuildContext context, String message) =>
      _show(context, message, AppColors.info, Icons.info);

  static void warning(BuildContext context, String message) =>
      _show(context, message, AppColors.warning, Icons.warning);

  static void _show(BuildContext context, String message, Color color, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
