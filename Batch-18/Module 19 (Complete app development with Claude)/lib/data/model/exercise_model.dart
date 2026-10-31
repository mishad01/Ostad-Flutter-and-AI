import '../../domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.id,
    required super.uuid,
    required super.categoryId,
    required super.muscleIds,
    required super.secondaryMuscleIds,
    required super.equipmentIds,
    required super.licenseAuthor,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      uuid: json['uuid'] ?? '',
      categoryId: json['category'],
      muscleIds: List<int>.from(json['muscles'] ?? []),
      secondaryMuscleIds: List<int>.from(json['muscles_secondary'] ?? []),
      equipmentIds: List<int>.from(json['equipment'] ?? []),
      licenseAuthor: json['license_author'] ?? '',
    );
  }
}
