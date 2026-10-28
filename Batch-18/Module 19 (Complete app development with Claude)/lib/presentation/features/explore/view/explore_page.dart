import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../core/section_title.dart';
import '../../../dummy_data/dummy_data.dart';
import '../ui_model/explore_workout_ui_model.dart';
import '../widgets/challenge_card.dart';
import '../widgets/explore_banner_card.dart';
import '../widgets/explore_workout_tile.dart';

part '../widgets/explore_page_workout_tile.dart';

const _horizontalPadding = EdgeInsets.symmetric(horizontal: 20);

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 120),
          children: [
            const Padding(
              padding: _horizontalPadding,
              child: ExploreBannerCard(
                title: AppStrings.bestQuarantineWorkout,
                imageUrl: AppStrings.quarantineWorkoutImageUrl,
              ),
            ),
            const SizedBox(height: 28),
            const Padding(
              padding: _horizontalPadding,
              child: SectionTitle(title: AppStrings.bestForYou),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 182,
              child: ListView.separated(
                padding: _horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemCount: (DummyData.bestForYou.length / 2).ceil(),
                separatorBuilder: (_, _) => const SizedBox(width: 16),
                itemBuilder: (context, column) {
                  final top = DummyData.bestForYou[column * 2];
                  final bottomIndex = column * 2 + 1;

                  return Column(
                    children: [
                      _WorkoutTile(workout: top),
                      if (bottomIndex < DummyData.bestForYou.length) ...[
                        const SizedBox(height: 10),
                        _WorkoutTile(workout: DummyData.bestForYou[bottomIndex]),
                      ],
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 28),
            const Padding(
              padding: _horizontalPadding,
              child: SectionTitle(title: AppStrings.challenge),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 110,
              child: ListView.separated(
                padding: _horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemCount: DummyData.challenges.length,
                separatorBuilder: (_, _) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final challenge = DummyData.challenges[index];

                  return ChallengeCard(
                    title: challenge.title,
                    icon: challenge.icon,
                    style: challenge.style,
                  );
                },
              ),
            ),
            const SizedBox(height: 28),
            const Padding(
              padding: _horizontalPadding,
              child: SectionTitle(title: AppStrings.fastWarmup),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 86,
              child: ListView.separated(
                padding: _horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemCount: DummyData.fastWarmup.length,
                separatorBuilder: (_, _) => const SizedBox(width: 16),
                itemBuilder: (context, index) => _WorkoutTile(workout: DummyData.fastWarmup[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
