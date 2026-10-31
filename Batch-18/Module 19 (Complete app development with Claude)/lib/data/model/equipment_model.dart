import '../../domain/entities/equipment.dart';

class EquipmentModel extends Equipment {
  EquipmentModel({required super.id, required super.name});

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}
