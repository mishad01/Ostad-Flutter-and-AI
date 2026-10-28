import 'package:flutter/material.dart';
import 'package:minimal_calorie_tracking/presentation/features/onboarding/view/onboarding_page.dart';

import 'core/app_colors.dart';
import 'core/app_strings.dart';
import 'presentation/features/home/view/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const OnboardingPage(),
    );
  }
}
