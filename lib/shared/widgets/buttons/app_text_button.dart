import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? foregroundColor;

  const AppTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: TextButton.styleFrom(foregroundColor: foregroundColor),
      );
    }

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: foregroundColor),
      child: Text(text),
    );
  }
}
