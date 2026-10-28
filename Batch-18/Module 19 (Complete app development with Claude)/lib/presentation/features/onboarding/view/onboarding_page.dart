import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../home/view/home_page.dart';
import '../widgets/onboarding_hero_image.dart';
import '../widgets/onboarding_progress_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _onGetStarted(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const Expanded(flex: 5, child: OnboardingHeroImage()),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          height: 1.3,
                        ),
                        children: [
                          const TextSpan(text: AppStrings.onboardingTitleStart),
                          TextSpan(
                            text: AppStrings.onboardingTitleHighlight,
                            style: TextStyle(backgroundColor: AppColors.accent),
                          ),
                          const TextSpan(text: AppStrings.onboardingTitleEnd),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      AppStrings.onboardingSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 20),
                    const OnboardingProgressIndicator(),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _onGetStarted(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.cardDark,
                          foregroundColor: AppColors.textOnPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        ),
                        child: const Text(
                          AppStrings.getStarted,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
