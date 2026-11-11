import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable category tile: rounded icon box with the category name below.
///
/// Used by Home and the Categories page. Receives all data and callbacks
/// via parameters — no provider access or hardcoded text.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
    this.size = 50,
    this.onTap,
  });

  /// Standard tile size for a 4-column layout on the current screen width.
  /// Tiles keep this size; leftover width becomes spacing between them.
  static double tileSize(BuildContext context) =>
      (MediaQuery.sizeOf(context).width - 100) / 4;

  final IconData icon;
  final String name;

  /// Width and height of the icon box. Text is centred under it.
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 34, color: AppColors.primary),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: size,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
