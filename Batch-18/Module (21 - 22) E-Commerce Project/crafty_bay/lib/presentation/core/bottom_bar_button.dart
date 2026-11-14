import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Compact teal text button for the [BottomActionBar] action slot
/// (Checkout, Add To Cart).
///
/// Pass `onPressed: null` to disable it.
class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 140,
  });

  final String label;
  final VoidCallback? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
