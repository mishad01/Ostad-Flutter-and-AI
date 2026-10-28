import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_strings.dart';

part 'app_bottom_nav_item.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _icons = [
    Icons.home_rounded,
    Icons.rocket_launch_outlined,
    Icons.bar_chart_rounded,
    Icons.person_outline_rounded,
  ];

  static const _labels = [
    AppStrings.navHome,
    AppStrings.navExplore,
    AppStrings.navAnalytics,
    AppStrings.navProfile,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: AppColors.cardDark, borderRadius: BorderRadius.circular(32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_icons.length, (index) {
          final isSelected = index == currentIndex;

          return _NavItem(
            icon: _icons[index],
            label: _labels[index],
            isSelected: isSelected,
            onTap: () => onTap(index),
          );
        }),
      ),
    );
  }
}
