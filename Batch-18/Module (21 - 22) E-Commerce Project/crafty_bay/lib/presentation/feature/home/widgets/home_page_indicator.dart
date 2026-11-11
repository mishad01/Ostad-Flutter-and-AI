import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Row of dots; the dot at [currentIndex] is filled with the brand colour.
class HomePageIndicator extends StatelessWidget {
  const HomePageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          Container(
            height: 12,
            width: 12,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == currentIndex ? AppColors.primary : AppColors.background,
              border: Border.all(
                color: i == currentIndex ? AppColors.primary : AppColors.iconInactive,
              ),
            ),
          ),
      ],
    );
  }
}
