import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Small grey circular icon button used in the home app bar.
class HomeCircleIconButton extends StatelessWidget {
  const HomeCircleIconButton({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: const BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: AppColors.icon),
      ),
    );
  }
}
