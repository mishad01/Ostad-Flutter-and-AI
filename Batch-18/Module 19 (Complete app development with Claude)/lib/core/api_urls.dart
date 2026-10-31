import 'app_strings.dart';

/// Every wger API endpoint the app calls, in one place.
class ApiUrls {
  static const String _base = AppStrings.apiBaseUrl;

  static const String exercises = '$_base/exercise/?limit=10';
  static const String exerciseCategories = '$_base/exercisecategory/';
  static const String equipment = '$_base/equipment/';

  /// Detail endpoint for a single exercise, e.g. `exerciseInfo(9)`.
  static String exerciseInfo(int id) => '$_base/exerciseinfo/$id/';
}
