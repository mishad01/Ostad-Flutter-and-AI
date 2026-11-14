import 'package:crafty_bay/core/app_colors.dart';
import 'package:flutter/material.dart';

/// Row of round colour swatches; the selected one shows a check mark.
class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        for (var i = 0; i < colors.length; i++)
          GestureDetector(
            onTap: () => onSelected(i),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colors[i],
                shape: BoxShape.circle,
              ),
              child: i == selectedIndex
                  ? const Icon(
                      Icons.check,
                      size: 18,
                      color: AppColors.textOnPrimary,
                    )
                  : null,
            ),
          ),
      ],
    );
  }
}
