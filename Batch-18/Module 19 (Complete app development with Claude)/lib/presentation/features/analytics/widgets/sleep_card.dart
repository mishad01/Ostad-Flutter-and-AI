import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'report_card.dart';
import 'report_card_header.dart';

part 'sleep_bar.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({super.key, required this.levels});

  /// Sleep depth per interval, each between 0 and 1.
  final List<double> levels;

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.sleepCard,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReportCardHeader(
            icon: Icons.bedtime_outlined,
            title: AppStrings.sleep,
            iconColor: AppColors.sleepBar,
            iconBackground: AppColors.sleepIconBg,
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: levels.map((level) => _SleepBar(level: level)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
