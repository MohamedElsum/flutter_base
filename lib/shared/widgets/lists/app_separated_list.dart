import 'package:flutter/material.dart';

class AppSeparatedList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final Widget? separator;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const AppSeparatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.padding,
    this.separator,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: items.length,
      separatorBuilder: (_, _) =>
          separator ?? const Divider(height: 1),
      itemBuilder: (context, index) =>
          itemBuilder(context, items[index], index),
    );
  }
}
