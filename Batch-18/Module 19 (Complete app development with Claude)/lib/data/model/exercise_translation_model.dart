import '../../domain/entities/exercise_translation.dart';

class ExerciseTranslationModel extends ExerciseTranslation {
  ExerciseTranslationModel({
    required super.id,
    required super.name,
    required super.description,
    required super.languageId,
  });

  factory ExerciseTranslationModel.fromJson(Map<String, dynamic> json) {
    return ExerciseTranslationModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      languageId: json['language'],
    );
  }
}
