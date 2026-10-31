import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimal_calorie_tracking/presentation/features/onboarding/view/onboarding_page.dart';

import 'core/app_colors.dart';
import 'core/app_strings.dart';
import 'presentation/features/explore/provider/explore_provider.dart';
import 'presentation/features/home/provider/home_provider.dart';
import 'presentation/features/home/view/home_page.dart';
import 'presentation/features/workout_detail/provider/workout_detail_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ExploreProvider()),
        ChangeNotifierProvider(create: (_) => WorkoutDetailProvider()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.background,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
