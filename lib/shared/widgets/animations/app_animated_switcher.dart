import 'package:flutter/material.dart';

class AppAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve switchInCurve;
  final Curve switchOutCurve;

  const AppAnimatedSwitcher({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.switchInCurve = Curves.easeIn,
    this.switchOutCurve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: child,
    );
  }
}
