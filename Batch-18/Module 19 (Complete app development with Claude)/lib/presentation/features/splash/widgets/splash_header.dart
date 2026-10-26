import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'splash_logo.dart';

class SplashHeader extends StatelessWidget {
  const SplashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SplashLogo(),
        SizedBox(height: 24),
        Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16),
        Text(
          AppStrings.splashTagline,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
