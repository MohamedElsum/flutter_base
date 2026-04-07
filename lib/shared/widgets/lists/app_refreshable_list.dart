import 'package:flutter/material.dart';

class AppRefreshableList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final Future<void> Function() onRefresh;
  final EdgeInsetsGeometry? padding;
  final Widget? separator;

  const AppRefreshableList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onRefresh,
    this.padding,
    this.separator,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: padding ?? const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            separator ?? const SizedBox(height: 8),
        itemBuilder: (context, index) =>
            itemBuilder(context, items[index], index),
      ),
    );
  }
}
