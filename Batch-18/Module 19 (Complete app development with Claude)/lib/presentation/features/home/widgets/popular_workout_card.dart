import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

part 'popular_workout_info_chip.dart';
part 'popular_workout_play_button.dart';

class PopularWorkoutCard extends StatelessWidget {
  const PopularWorkoutCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.calories,
    required this.minutes,
    this.onPlay,
  });

  final String title;
  final String imageUrl;
  final int calories;
  final int minutes;
  final VoidCallback? onPlay;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0),
                  Colors.black.withValues(alpha: 0.75),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _InfoChip(
                  icon: Icons.local_fire_department,
                  label: '$calories ${AppStrings.kcalUnit}',
                ),
                const SizedBox(height: 10),
                _InfoChip(
                  icon: Icons.timer_outlined,
                  label: '$minutes ${AppStrings.minUnit}',
                ),
              ],
            ),
          ),
          Positioned(right: 20, bottom: 26, child: _PlayButton(onTap: onPlay)),
        ],
      ),
    );
  }
}
