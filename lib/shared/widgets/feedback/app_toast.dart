import 'package:flutter/material.dart';

class AppToast {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => _ToastWidget(message: message),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () => entry.remove());
  }
}

class _ToastWidget extends StatelessWidget {
  final String message;

  const _ToastWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 24,
      right: 24,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inverseSurface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
