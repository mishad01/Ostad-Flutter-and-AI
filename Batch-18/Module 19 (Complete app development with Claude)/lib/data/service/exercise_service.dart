import 'dart:convert';

import '../../core/api_urls.dart';
import '../../domain/entities/equipment.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_category.dart';
import '../../domain/entities/exercise_info.dart';
import '../model/equipment_model.dart';
import '../model/exercise_category_model.dart';
import '../model/exercise_info_model.dart';
import '../model/exercise_model.dart';
import 'network_caller.dart';
import 'network_response.dart';

/// wger exercise endpoints. Each method returns domain entities and throws an
/// [Exception] with a readable message on failure, so a provider can catch it.
class ExerciseService {
  final _networkCaller = NetworkCaller();

  Future<List<Exercise>> getExercises() async {
    final json = await _get(ApiUrls.exercises);
    return _results(json).map((e) => ExerciseModel.fromJson(e)).toList();
  }

  /// Exercises with names and images, optionally filtered by category.
  Future<List<ExerciseInfo>> getExerciseInfoList({
    int? categoryId,
    int limit = 20,
  }) async {
    final json = await _get(
      ApiUrls.exerciseInfoList(categoryId: categoryId, limit: limit),
    );
    return _results(json).map((e) => ExerciseInfoModel.fromJson(e)).toList();
  }

  Future<ExerciseInfo> getExerciseInfo(int id) async {
    final json = await _get(ApiUrls.exerciseInfo(id));
    return ExerciseInfoModel.fromJson(json);
  }

  Future<List<ExerciseCategory>> getCategories() async {
    final json = await _get(ApiUrls.exerciseCategories);
    return _results(json)
        .map((e) => ExerciseCategoryModel.fromJson(e))
        .toList();
  }

  Future<List<Equipment>> getEquipment() async {
    final json = await _get(ApiUrls.equipment);
    return _results(json).map((e) => EquipmentModel.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> _get(String url) async {
    final NetworkResponse response = await _networkCaller.get(
      Uri.parse(url),
      headers: {'accept': 'application/json'},
    );
    if (!response.isSuccess) {
      throw Exception(response.errorMessage);
    }
    return jsonDecode(response.body!) as Map<String, dynamic>;
  }

  /// List endpoints wrap their items in a paginated `results` array.
  List<Map<String, dynamic>> _results(Map<String, dynamic> json) {
    return List<Map<String, dynamic>>.from(json['results'] ?? []);
  }
}
