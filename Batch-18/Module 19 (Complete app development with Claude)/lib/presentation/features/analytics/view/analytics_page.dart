import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../core/section_title.dart';
import '../../../dummy_data/dummy_data.dart';
import '../widgets/active_calories_card.dart';
import '../widgets/analytics_date_selector.dart';
import '../widgets/cycling_card.dart';
import '../widgets/heart_rate_card.dart';
import '../widgets/motivation_card.dart';
import '../widgets/sleep_card.dart';
import '../widgets/steps_card.dart';
import '../widgets/training_time_card.dart';
import '../widgets/water_card.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int _selectedDayIndex = 2;

  void _onDaySelected(int index) => setState(() => _selectedDayIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
          children: [
            const Text(
              AppStrings.analyticsMonth,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            AnalyticsDateSelector(
              weekdays: AppStrings.weekdays,
              days: DummyData.analyticsDays,
              selectedIndex: _selectedDayIndex,
              onSelected: _onDaySelected,
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: AppStrings.todayReport),
            const SizedBox(height: 16),
            const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ActiveCaloriesCard(calories: 645),
                        SizedBox(height: 16),
                        TrainingTimeCard(progress: 0.8),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(flex: 3, child: CyclingCard()),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 3, child: HeartRateCard(bpm: 79)),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StepsCard(steps: 999, goal: 2000),
                        SizedBox(height: 16),
                        Expanded(child: MotivationCard(message: AppStrings.keepItUp)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: SleepCard(levels: DummyData.sleepLevels)),
                  SizedBox(width: 16),
                  Expanded(child: WaterCard(cups: 6, goal: 8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
