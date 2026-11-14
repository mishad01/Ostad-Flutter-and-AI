import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Compact "− 01 +" control for cart lines and the product details page.
///
/// The parent owns the value: it passes [quantity] and updates it from
/// [onChanged]. The value is clamped between [min] and [max].
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.min = 1,
    this.max = 99,
  });

  final int quantity;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepButton(
          icon: Icons.remove,
          filled: false,
          onTap: quantity > min ? () => onChanged(quantity - 1) : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            quantity.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        _StepButton(
          icon: Icons.add,
          filled: true,
          onTap: quantity < max ? () => onChanged(quantity + 1) : null,
        ),
      ],
    );
  }
}

// WHY: private helper that only exists for QuantityStepper's two buttons.
class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  final IconData icon;

  /// Solid teal (+) vs. pale teal (−).
  final bool filled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : AppColors.primaryLight,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Icon(
          icon,
          size: 16,
          color: filled ? AppColors.textOnPrimary : AppColors.primary,
        ),
      ),
    );
  }
}
