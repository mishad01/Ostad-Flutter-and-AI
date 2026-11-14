import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Row of round size chips; the selected one is filled teal.
class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> sizes;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        for (var i = 0; i < sizes.length; i++)
          GestureDetector(
            onTap: () => onSelected(i),
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == selectedIndex ? AppColors.primary : null,
                border: Border.all(
                  color: i == selectedIndex
                      ? AppColors.primary
                      : AppColors.iconInactive,
                ),
              ),
              child: Text(
                sizes[i],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: i == selectedIndex
                      ? AppColors.textOnPrimary
                      : AppColors.textPrimary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
