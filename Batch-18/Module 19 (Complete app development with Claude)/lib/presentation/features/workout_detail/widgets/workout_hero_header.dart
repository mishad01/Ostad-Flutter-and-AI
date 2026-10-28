import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

part 'workout_stats_panel.dart';
part 'workout_stat_item.dart';

class WorkoutHeroHeader extends StatelessWidget {
  const WorkoutHeroHeader({
    super.key,
    required this.imageUrl,
    required this.minutes,
    required this.calories,
  });

  final String imageUrl;
  final int minutes;
  final int calories;

  static const double _imageHeight = 250;
  static const double _statsOverlap = 32;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _imageHeight + _statsOverlap,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: _imageHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: _StatsPanel(minutes: minutes, calories: calories),
            ),
          ),
        ],
      ),
    );
  }
}
