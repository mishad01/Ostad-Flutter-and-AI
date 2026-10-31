import '../../domain/entities/exercise_info.dart';
import 'equipment_model.dart';
import 'exercise_category_model.dart';
import 'exercise_image_model.dart';
import 'exercise_translation_model.dart';
import 'muscle_model.dart';

class ExerciseInfoModel extends ExerciseInfo {
  ExerciseInfoModel({
    required super.id,
    required super.uuid,
    required super.category,
    required super.muscles,
    required super.secondaryMuscles,
    required super.equipment,
    required super.images,
    required super.translations,
    required super.licenseAuthor,
  });

  factory ExerciseInfoModel.fromJson(Map<String, dynamic> json) {
    List<T> parseList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
      return (json[key] as List? ?? [])
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return ExerciseInfoModel(
      id: json['id'],
      uuid: json['uuid'] ?? '',
      category: ExerciseCategoryModel.fromJson(json['category']),
      muscles: parseList('muscles', MuscleModel.fromJson),
      secondaryMuscles: parseList('muscles_secondary', MuscleModel.fromJson),
      equipment: parseList('equipment', EquipmentModel.fromJson),
      images: parseList('images', ExerciseImageModel.fromJson),
      translations: parseList('translations', ExerciseTranslationModel.fromJson),
      licenseAuthor: json['license_author'] ?? '',
    );
  }
}
