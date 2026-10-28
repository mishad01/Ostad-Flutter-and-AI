import 'package:flutter/material.dart';

import '../../core/app_strings.dart';
import '../features/explore/ui_model/challenge_ui_model.dart';
import '../features/explore/ui_model/explore_workout_ui_model.dart';
import '../features/home/ui_model/today_plan_ui_model.dart';
import '../features/workout_detail/ui_model/workout_round_ui_model.dart';
import '../features/workout_detail/ui_model/workout_ui_model.dart';

class DummyData {
  // Home
  static const List<WorkoutUiModel> popularWorkouts = [
    WorkoutUiModel(
      title: AppStrings.lowerBodyTraining,
      imageUrl: AppStrings.lowerBodyImageUrl,
      calories: 500,
      minutes: 50,
    ),
    WorkoutUiModel(
      title: AppStrings.handTraining,
      imageUrl: AppStrings.handTrainingImageUrl,
      calories: 600,
      minutes: 40,
    ),
  ];

  static const List<TodayPlanUiModel> todayPlans = [
    TodayPlanUiModel(
      title: AppStrings.pushUp,
      subtitle: AppStrings.pushUpGoal,
      imageUrl: AppStrings.pushUpImageUrl,
      level: AppStrings.levelIntermediate,
      progress: 0.45,
    ),
    TodayPlanUiModel(
      title: AppStrings.sitUp,
      subtitle: AppStrings.sitUpGoal,
      imageUrl: AppStrings.sitUpImageUrl,
      level: AppStrings.levelBeginner,
      progress: 0.75,
    ),
    TodayPlanUiModel(
      title: AppStrings.kneePushUp,
      subtitle: AppStrings.kneePushUpGoal,
      imageUrl: AppStrings.kneePushUpImageUrl,
      level: AppStrings.levelBeginner,
      progress: 0.2,
    ),
  ];

  // Explore
  static const List<ExploreWorkoutUiModel> bestForYou = [
    ExploreWorkoutUiModel(
      title: AppStrings.bellyFatBurner,
      imageUrl: AppStrings.bellyFatImageUrl,
      minutes: 10,
      level: AppStrings.levelBeginner,
    ),
    ExploreWorkoutUiModel(
      title: AppStrings.plank,
      imageUrl: AppStrings.plankImageUrl,
      minutes: 5,
      level: AppStrings.levelExpert,
    ),
    ExploreWorkoutUiModel(
      title: AppStrings.loseFat,
      imageUrl: AppStrings.loseFatImageUrl,
      minutes: 10,
      level: AppStrings.levelBeginner,
    ),
    ExploreWorkoutUiModel(
      title: AppStrings.buildWider,
      imageUrl: AppStrings.buildWiderImageUrl,
      minutes: 30,
      level: AppStrings.levelIntermediate,
    ),
  ];

  static const List<ChallengeUiModel> challenges = [
    ChallengeUiModel(
      title: AppStrings.plankChallenge,
      icon: Icons.local_fire_department_outlined,
      style: ChallengeCardStyle.accent,
    ),
    ChallengeUiModel(
      title: AppStrings.sprintChallenge,
      icon: Icons.directions_run_rounded,
      style: ChallengeCardStyle.dark,
    ),
    ChallengeUiModel(
      title: AppStrings.squatChallenge,
      icon: Icons.local_drink_outlined,
      style: ChallengeCardStyle.light,
    ),
  ];

  static const List<ExploreWorkoutUiModel> fastWarmup = [
    ExploreWorkoutUiModel(
      title: AppStrings.legExercises,
      imageUrl: AppStrings.legExercisesImageUrl,
      minutes: 10,
      level: AppStrings.levelBeginner,
    ),
    ExploreWorkoutUiModel(
      title: AppStrings.backwardLunge,
      imageUrl: AppStrings.backwardLungeImageUrl,
      minutes: 5,
      level: AppStrings.levelBeginner,
    ),
  ];

  // Analytics
  static const List<int> analyticsDays = [10, 11, 12, 13, 14, 15, 16, 17, 18];
  static const List<double> sleepLevels = [
    0.6,
    0.75,
    0.45,
    0.85,
    0.95,
    0.35,
    0.6,
    0.3,
    1.0,
    0.45,
    0.75,
  ];

  // Workout detail
  static const List<WorkoutRoundUiModel> workoutRounds = [
    WorkoutRoundUiModel(
      title: AppStrings.jumpingJacks,
      imageUrl: AppStrings.jumpingJacksImageUrl,
      duration: AppStrings.duration30s,
    ),
    WorkoutRoundUiModel(
      title: AppStrings.squats,
      imageUrl: AppStrings.squatsImageUrl,
      duration: AppStrings.duration1m,
    ),
    WorkoutRoundUiModel(
      title: AppStrings.backwardLungeRound,
      imageUrl: AppStrings.backwardLungeImageUrl,
      duration: AppStrings.duration45s,
    ),
    WorkoutRoundUiModel(
      title: AppStrings.gluteBridge,
      imageUrl: AppStrings.gluteBridgeImageUrl,
      duration: AppStrings.duration40s,
    ),
  ];
}
