import 'package:flutter/material.dart';
import 'package:flutter_base/shared/widgets/loading/app_loading_indicator.dart';

class AppPaginatedList<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final VoidCallback? onLoadMore;
  final bool isLoading;
  final bool hasMore;
  final EdgeInsetsGeometry? padding;
  final Widget? separator;

  const AppPaginatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onLoadMore,
    this.isLoading = false,
    this.hasMore = true,
    this.padding,
    this.separator,
  });

  @override
  State<AppPaginatedList<T>> createState() => _AppPaginatedListState<T>();
}

class _AppPaginatedListState<T> extends State<AppPaginatedList<T>> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!widget.isLoading && widget.hasMore) {
        widget.onLoadMore?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: widget.padding ?? const EdgeInsets.all(16),
      itemCount: widget.items.length + (widget.isLoading ? 1 : 0),
      separatorBuilder: (_, _) =>
          widget.separator ?? const SizedBox(height: 8),
      itemBuilder: (context, index) {
        if (index == widget.items.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: AppLoadingIndicator(),
          );
        }
        return widget.itemBuilder(context, widget.items[index], index);
      },
    );
  }
}
