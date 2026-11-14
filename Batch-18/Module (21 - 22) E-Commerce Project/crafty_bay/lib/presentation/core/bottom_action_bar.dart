import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    super.key,
    required this.leading,
    required this.action,
  });

  /// Left side content (price block, reviews label, ...).
  final Widget leading;

  /// Right side action (button, circle icon button, ...).
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      // SafeArea keeps the action clear of the home indicator.
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: leading),
              const SizedBox(width: 16),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
