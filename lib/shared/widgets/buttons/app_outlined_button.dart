import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;
  final Color? foregroundColor;

  const AppOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: foregroundColor ?? Theme.of(context).colorScheme.primary,
              ),
            )
          : icon != null
              ? Icon(icon)
              : const SizedBox.shrink(),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 48),
        foregroundColor: foregroundColor,
      ),
    );

    return isExpanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
