import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

part 'explore_workout_tag.dart';

class ExploreWorkoutTile extends StatelessWidget {
  const ExploreWorkoutTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.minutes,
    required this.level,
  });

  final String title;
  final String imageUrl;
  final int minutes;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                _Tag(label: '$minutes ${AppStrings.minUnitLower}'),
                const SizedBox(height: 4),
                _Tag(label: level),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
