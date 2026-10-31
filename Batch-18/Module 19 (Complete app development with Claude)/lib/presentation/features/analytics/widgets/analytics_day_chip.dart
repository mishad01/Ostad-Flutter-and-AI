// WHY: part of analytics_date_selector.dart — private widget used only by that file.

part of 'analytics_date_selector.dart';

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.weekday,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  final String weekday;
  final int day;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? AppColors.textOnPrimary : AppColors.cardDark;
    final textStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: textColor,
    );

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 46,
            height: 56,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.cardDark : AppColors.accent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(weekday, style: textStyle),
                Text('$day', style: textStyle),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.cardDark : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
