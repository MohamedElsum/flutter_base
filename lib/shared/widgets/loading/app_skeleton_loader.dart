import 'package:flutter/material.dart';
import 'package:flutter_base/shared/widgets/loading/app_shimmer.dart';

class AppSkeletonLoader extends StatelessWidget {
  final int itemCount;
  final double itemHeight;
  final double spacing;

  const AppSkeletonLoader({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      separatorBuilder: (_, _) => SizedBox(height: spacing),
      itemBuilder: (_, _) => Row(
        children: [
          const AppShimmer(width: 56, height: 56, borderRadius: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                AppShimmer(height: 16, width: MediaQuery.sizeOf(context).width * 0.5),
                const SizedBox(height: 8),
                const AppShimmer(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
