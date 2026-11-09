import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

class SplashLoader extends StatelessWidget {
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 28,
      height: 28,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: AppColors.primary,
      ),
    );
  }
}
