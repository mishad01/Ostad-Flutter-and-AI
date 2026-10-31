import '../../../../domain/entities/exercise_info.dart';
import '../../../core/exercise_info_extension.dart';

class ExploreWorkoutUiModel {
  const ExploreWorkoutUiModel({
    required this.title,
    required this.imageUrl,
    required this.minutes,
    required this.level,
  });

  factory ExploreWorkoutUiModel.fromExercise(ExerciseInfo exercise) {
    return ExploreWorkoutUiModel(
      title: exercise.title,
      imageUrl: exercise.mainImageUrl,
      minutes: exercise.estimatedMinutes,
      level: exercise.level,
    );
  }

  final String title;
  final String imageUrl;
  final int minutes;
  final String level;
}
