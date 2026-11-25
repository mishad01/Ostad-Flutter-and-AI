import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'core/app_strings.dart';
import 'features/splash/view/splash_page.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: AppStrings.appName,
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    theme: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      useMaterial3: true,
    ),
    home: const SplashPage(),
  );
}
