import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../core/app_bottom_nav_bar.dart';
import '../../../core/section_title.dart';
import '../../../dummy_data/dummy_data.dart';
import '../../analytics/view/analytics_page.dart';
import '../../explore/view/explore_page.dart';
import '../../workout_detail/ui_model/workout_ui_model.dart';
import '../../workout_detail/view/workout_detail_page.dart';
import '../widgets/home_greeting_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/popular_workout_card.dart';
import '../widgets/today_plan_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navIndex = 0;

  void _onNavTap(int index) => setState(() => _navIndex = index);

  void _onOpenWorkout(WorkoutUiModel workout) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => WorkoutDetailPage(workout: workout)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: switch (_navIndex) {
        1 => const ExplorePage(),
        2 => const AnalyticsPage(),
        _ => SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
            children: [
              const HomeGreetingHeader(userName: AppStrings.demoUserName),
              const SizedBox(height: 24),
              const HomeSearchBar(),
              const SizedBox(height: 32),
              const SectionTitle(title: AppStrings.popularWorkouts),
              const SizedBox(height: 16),
              SizedBox(
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: DummyData.popularWorkouts.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final workout = DummyData.popularWorkouts[index];

                    return SizedBox(
                      width: 220,
                      child: PopularWorkoutCard(
                        title: workout.title,
                        imageUrl: workout.imageUrl,
                        calories: workout.calories,
                        minutes: workout.minutes,
                        onPlay: () => _onOpenWorkout(workout),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              const SectionTitle(title: AppStrings.todayPlan),
              const SizedBox(height: 16),
              ...List.generate(DummyData.todayPlans.length, (index) {
                final plan = DummyData.todayPlans[index];

                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == DummyData.todayPlans.length - 1 ? 0 : 16,
                  ),
                  child: TodayPlanCard(
                    title: plan.title,
                    subtitle: plan.subtitle,
                    imageUrl: plan.imageUrl,
                    level: plan.level,
                    progress: plan.progress,
                  ),
                );
              }),
            ],
          ),
        ),
      },
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: AppBottomNavBar(currentIndex: _navIndex, onTap: _onNavTap),
      ),
      extendBody: true,
    );
  }
}
