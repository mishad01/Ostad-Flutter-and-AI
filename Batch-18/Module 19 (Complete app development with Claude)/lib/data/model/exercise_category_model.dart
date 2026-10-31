import '../../domain/entities/exercise_category.dart';

class ExerciseCategoryModel extends ExerciseCategory {
  ExerciseCategoryModel({required super.id, required super.name});

  factory ExerciseCategoryModel.fromJson(Map<String, dynamic> json) {
    return ExerciseCategoryModel(id: json['id'], name: json['name'] ?? '');
  }
}
