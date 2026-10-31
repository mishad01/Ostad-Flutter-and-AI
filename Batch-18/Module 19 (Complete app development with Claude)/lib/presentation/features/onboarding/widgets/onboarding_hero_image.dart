import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

part 'onboarding_hero_placeholder.dart';

class OnboardingHeroImage extends StatelessWidget {
  const OnboardingHeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppStrings.onboardingHeroImage,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const _HeroPlaceholder(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 140,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.background.withAlpha(0),
                  AppColors.background,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
