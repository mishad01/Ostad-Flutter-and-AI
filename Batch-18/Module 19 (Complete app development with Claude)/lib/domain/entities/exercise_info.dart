import 'equipment.dart';
import 'exercise_category.dart';
import 'exercise_image.dart';
import 'exercise_translation.dart';
import 'muscle.dart';

/// Full exercise from `/exerciseinfo/<id>/` — related objects are expanded.
class ExerciseInfo {
  final int id;
  final String uuid;
  final ExerciseCategory category;
  final List<Muscle> muscles;
  final List<Muscle> secondaryMuscles;
  final List<Equipment> equipment;
  final List<ExerciseImage> images;
  final List<ExerciseTranslation> translations;
  final String licenseAuthor;

  ExerciseInfo({
    required this.id,
    required this.uuid,
    required this.category,
    required this.muscles,
    required this.secondaryMuscles,
    required this.equipment,
    required this.images,
    required this.translations,
    required this.licenseAuthor,
  });
}
