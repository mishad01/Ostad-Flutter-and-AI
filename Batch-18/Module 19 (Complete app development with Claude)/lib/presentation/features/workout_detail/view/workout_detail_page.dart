import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../core/async_placeholder.dart';
import '../../../dummy_data/dummy_data.dart';
import '../../../core/exercise_info_extension.dart';
import '../provider/workout_detail_provider.dart';
import '../ui_model/workout_ui_model.dart';
import '../widgets/workout_hero_header.dart';
import '../widgets/workout_round_card.dart';
import '../widgets/workout_rounds_header.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({super.key, required this.workout});

  final WorkoutUiModel workout;

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  WorkoutUiModel get workout => widget.workout;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted)
        context.read<WorkoutDetailProvider>().fetchExercise(workout.id);
    });
  }

  void _onStartWorkout() {}

  void _onPlayRound(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          AppStrings.workout,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
            children: [
              WorkoutHeroHeader(
                imageUrl: workout.imageUrl,
                minutes: workout.minutes,
                calories: workout.calories,
              ),
              const SizedBox(height: 28),
              Text(
                workout.title.replaceAll('\n', ' '),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Consumer<WorkoutDetailProvider>(
                builder: (context, provider, _) {
                  final exercise = provider.exercise;
                  if (exercise == null) {
                    return AsyncPlaceholder(
                      isLoading: provider.isLoading,
                      errorMessage: provider.errorMessage,
                    );
                  }

                  return Text(
                    exercise.plainDescription,
                    style: const TextStyle(
                      color: AppColors.darkTextSecondary,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              WorkoutRoundsHeader(
                current: 1,
                total: DummyData.workoutRounds.length,
              ),
              const SizedBox(height: 16),
              ...List.generate(DummyData.workoutRounds.length, (index) {
                final round = DummyData.workoutRounds[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: WorkoutRoundCard(
                    title: round.title,
                    imageUrl: round.imageUrl,
                    duration: round.duration,
                    onPlay: () => _onPlayRound(index),
                  ),
                );
              }),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _onStartWorkout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.cardDark,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    AppStrings.letsWorkout,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
