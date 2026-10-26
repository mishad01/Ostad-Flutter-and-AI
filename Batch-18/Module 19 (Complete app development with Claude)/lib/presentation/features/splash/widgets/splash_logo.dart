import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.water_drop_outlined,
        color: AppColors.textOnPrimary,
        size: 30,
      ),
    );
  }
}
