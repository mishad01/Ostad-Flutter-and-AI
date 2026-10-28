import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'report_card.dart';

class ActiveCaloriesCard extends StatelessWidget {
  const ActiveCaloriesCard({super.key, required this.calories});

  final int calories;

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.background,
      hasBorder: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.activeCalories,
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 6),
          Text(
            '$calories ${AppStrings.calUnit}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
