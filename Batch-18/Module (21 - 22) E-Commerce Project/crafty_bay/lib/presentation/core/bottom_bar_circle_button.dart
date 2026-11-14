import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Round teal icon button for the [BottomActionBar] action slot
/// (the "+" next to Reviews). Defaults to [Icons.add].
class BottomBarCircleButton extends StatelessWidget {
  const BottomBarCircleButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
  });

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, size: 20, color: AppColors.textOnPrimary),
        ),
      ),
    );
  }
}
