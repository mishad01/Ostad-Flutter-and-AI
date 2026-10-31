import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

part 'today_plan_level_badge.dart';
part 'today_plan_progress_bar.dart';

class TodayPlanCard extends StatelessWidget {
  const TodayPlanCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.level,
    required this.progress,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final String level;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 28),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ProgressBar(progress: progress),
                  ],
                ),
              ),
            ],
          ),
          Positioned(top: 0, right: 0, child: _LevelBadge(label: level)),
        ],
      ),
    );
  }
}
