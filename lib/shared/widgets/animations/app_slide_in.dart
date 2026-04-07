import 'package:flutter/material.dart';

enum SlideDirection { left, right, top, bottom }

class AppSlideIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final SlideDirection direction;

  const AppSlideIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.direction = SlideDirection.bottom,
  });

  @override
  State<AppSlideIn> createState() => _AppSlideInState();
}

class _AppSlideInState extends State<AppSlideIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    final begin = switch (widget.direction) {
      SlideDirection.left => const Offset(-1, 0),
      SlideDirection.right => const Offset(1, 0),
      SlideDirection.top => const Offset(0, -1),
      SlideDirection.bottom => const Offset(0, 1),
    };

    _animation = Tween<Offset>(begin: begin, end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
