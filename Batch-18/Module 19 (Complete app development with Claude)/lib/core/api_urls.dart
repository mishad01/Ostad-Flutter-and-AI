import 'app_strings.dart';

/// Every wger API endpoint the app calls, in one place.
class ApiUrls {
  static const String _base = AppStrings.apiBaseUrl;

  static const String exercises = '$_base/exercise/?limit=10';
  static const String exerciseCategories = '$_base/exercisecategory/';
  static const String equipment = '$_base/equipment/';

  /// Exercises with names, images and translations in one call.
  /// Pass [categoryId] to filter, e.g. `exerciseInfoList(categoryId: 10)`.
  static String exerciseInfoList({int? categoryId, int limit = 20}) {
    final category = categoryId == null ? '' : '&category=$categoryId';
    return '$_base/exerciseinfo/?language=2&limit=$limit$category';
  }

  /// Detail endpoint for a single exercise, e.g. `exerciseInfo(9)`.
  static String exerciseInfo(int id) => '$_base/exerciseinfo/$id/';
}
