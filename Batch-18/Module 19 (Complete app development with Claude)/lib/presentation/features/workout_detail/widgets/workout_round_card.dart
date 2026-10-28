import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class WorkoutRoundCard extends StatelessWidget {
  const WorkoutRoundCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    this.onPlay,
  });

  final String title;
  final String imageUrl;
  final String duration;
  final VoidCallback? onPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(imageUrl, width: 58, height: 58, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onPlay,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.darkBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow_rounded, color: AppColors.accent, size: 20),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
