import '../../../../domain/entities/exercise_info.dart';
import '../../../core/exercise_info_extension.dart';

class WorkoutUiModel {
  const WorkoutUiModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.calories,
    required this.minutes,
  });

  factory WorkoutUiModel.fromExercise(ExerciseInfo exercise) {
    return WorkoutUiModel(
      id: exercise.id,
      title: exercise.title,
      imageUrl: exercise.mainImageUrl,
      calories: exercise.estimatedCalories,
      minutes: exercise.estimatedMinutes,
    );
  }

  final int id;
  final String title;
  final String imageUrl;
  final int calories;
  final int minutes;
}
