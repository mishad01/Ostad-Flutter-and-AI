import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Small grey [label] above a bold teal [value] (e.g. "Total Price" / "$100,000.00").
///
/// Meant for the [BottomActionBar] leading slot. Receives all text via
/// parameters — pass `AppStrings.price` / `AppStrings.totalPrice` for the label.
class BottomBarPrice extends StatelessWidget {
  const BottomBarPrice({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
