import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? maxHeight;

  const AppBottomSheet({
    super.key,
    this.title,
    required this.child,
    this.maxHeight,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget child,
    double? maxHeight,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AppBottomSheet(
        title: title,
        maxHeight: maxHeight,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: maxHeight != null
          ? BoxConstraints(maxHeight: maxHeight!)
          : null,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: .min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          if (title != null) ...[
            Text(title!, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }
}
