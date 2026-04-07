import 'package:flutter/material.dart';
import 'package:flutter_base/shared/widgets/media/app_cached_image.dart';

class AppImageCard extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final double imageHeight;

  const AppImageCard({
    super.key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.onTap,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            AppCachedImage(
              imageUrl: imageUrl,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            if (title != null || subtitle != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    if (title != null)
                      Text(title!, style: Theme.of(context).textTheme.titleMedium),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
