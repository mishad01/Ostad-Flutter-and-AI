import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import 'report_card.dart';

class MotivationCard extends StatelessWidget {
  const MotivationCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.motivationCard,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
