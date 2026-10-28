import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'report_card.dart';
import 'report_card_header.dart';

class StepsCard extends StatelessWidget {
  const StepsCard({super.key, required this.steps, required this.goal});

  final int steps;
  final int goal;

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.stepsCard,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      child: Column(
        children: [
          const ReportCardHeader(
            icon: Icons.directions_walk_rounded,
            title: AppStrings.steps,
            iconColor: AppColors.stepsIcon,
            iconBackground: AppColors.stepsIconBg,
          ),
          const SizedBox(height: 14),
          Text('$steps/$goal', style: const TextStyle(fontSize: 13, color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: (steps / goal).clamp(0, 1),
              minHeight: 12,
              color: AppColors.stepsBar,
              backgroundColor: AppColors.stepsTrack,
            ),
          ),
        ],
      ),
    );
  }
}
