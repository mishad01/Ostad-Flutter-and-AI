import '../../domain/entities/exercise_image.dart';

class ExerciseImageModel extends ExerciseImage {
  ExerciseImageModel({
    required super.id,
    required super.imageUrl,
    required super.thumbnailSmallUrl,
    required super.thumbnailMediumUrl,
    required super.isMain,
  });

  factory ExerciseImageModel.fromJson(Map<String, dynamic> json) {
    final thumbnails = (json['thumbnails'] as Map<String, dynamic>?) ?? {};
    return ExerciseImageModel(
      id: json['id'],
      imageUrl: json['image'] ?? '',
      thumbnailSmallUrl: thumbnails['small'] ?? '',
      thumbnailMediumUrl: thumbnails['medium'] ?? '',
      isMain: json['is_main'] ?? false,
    );
  }
}
