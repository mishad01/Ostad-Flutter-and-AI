import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: const Row(
        children: [
          Icon(Icons.search, color: AppColors.textSecondary),
          SizedBox(width: 12),
          Text(AppStrings.search, style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
