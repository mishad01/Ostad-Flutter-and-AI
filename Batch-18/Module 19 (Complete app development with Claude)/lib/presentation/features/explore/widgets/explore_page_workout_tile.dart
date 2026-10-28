// WHY: part of explore_page.dart — private widget used only by that file.

part of '../view/explore_page.dart';

class _WorkoutTile extends StatelessWidget {
  const _WorkoutTile({required this.workout});

  final ExploreWorkoutUiModel workout;

  @override
  Widget build(BuildContext context) {
    return ExploreWorkoutTile(
      title: workout.title,
      imageUrl: workout.imageUrl,
      minutes: workout.minutes,
      level: workout.level,
    );
  }
}
