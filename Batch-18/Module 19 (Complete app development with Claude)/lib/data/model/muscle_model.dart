import '../../domain/entities/muscle.dart';

class MuscleModel extends Muscle {
  MuscleModel({
    required super.id,
    required super.name,
    required super.nameEn,
    required super.isFront,
    required super.imageUrlMain,
    required super.imageUrlSecondary,
  });

  factory MuscleModel.fromJson(Map<String, dynamic> json) {
    return MuscleModel(
      id: json['id'],
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      isFront: json['is_front'] ?? false,
      imageUrlMain: json['image_url_main'] ?? '',
      imageUrlSecondary: json['image_url_secondary'] ?? '',
    );
  }
}
