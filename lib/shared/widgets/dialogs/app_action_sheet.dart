import 'package:flutter/material.dart';

class AppActionSheet extends StatelessWidget {
  final String? title;
  final List<AppActionSheetItem> actions;

  const AppActionSheet({
    super.key,
    this.title,
    required this.actions,
  });

  static Future<void> show({
    required BuildContext context,
    String? title,
    required List<AppActionSheetItem> actions,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AppActionSheet(title: title, actions: actions),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(title!, style: Theme.of(context).textTheme.titleMedium),
              ),
            ...actions.map((action) => ListTile(
                  leading: action.icon != null ? Icon(action.icon) : null,
                  title: Text(
                    action.title,
                    style: action.isDestructive
                        ? TextStyle(color: Theme.of(context).colorScheme.error)
                        : null,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    action.onTap?.call();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class AppActionSheetItem {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isDestructive;

  const AppActionSheetItem({
    required this.title,
    this.icon,
    this.onTap,
    this.isDestructive = false,
  });
}
