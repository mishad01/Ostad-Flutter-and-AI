import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  const OnboardingProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: SizedBox(
        width: 80,
        height: 6,
        child: Row(
          children: const [
            Expanded(flex: 4, child: ColoredBox(color: AppColors.accent)),
            Expanded(flex: 6, child: ColoredBox(color: AppColors.cardDark)),
          ],
        ),
      ),
    );
  }
}
