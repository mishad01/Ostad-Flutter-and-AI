import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class HomeGreetingHeader extends StatelessWidget {
  const HomeGreetingHeader({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.goodMorning,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 26,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
