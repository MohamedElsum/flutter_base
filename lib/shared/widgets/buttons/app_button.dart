import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final button = FilledButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : icon != null
              ? Icon(icon)
              : const SizedBox.shrink(),
      label: Text(text),
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 48),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
    );

    return isExpanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
