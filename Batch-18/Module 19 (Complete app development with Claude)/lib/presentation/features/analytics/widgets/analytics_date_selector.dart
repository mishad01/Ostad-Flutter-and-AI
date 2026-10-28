import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

part 'analytics_day_chip.dart';

class AnalyticsDateSelector extends StatelessWidget {
  const AnalyticsDateSelector({
    super.key,
    required this.weekdays,
    required this.days,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> weekdays;
  final List<int> days;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) => _DayChip(
          weekday: weekdays[index],
          day: days[index],
          isSelected: index == selectedIndex,
          onTap: () => onSelected(index),
        ),
      ),
    );
  }
}
