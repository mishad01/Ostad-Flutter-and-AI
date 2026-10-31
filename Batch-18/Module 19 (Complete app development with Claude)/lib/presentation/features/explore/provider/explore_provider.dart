import 'package:flutter/foundation.dart';

import '../../../../data/service/exercise_service.dart';
import '../../../../domain/entities/exercise_category.dart';
import '../../../../domain/entities/exercise_info.dart';

/// Owns the state of the Explore screen: the category list and the
/// workouts shown for the selected category (all categories when `null`).
class ExploreProvider extends ChangeNotifier {
  final _service = ExerciseService();

  List<ExerciseCategory> _categories = [];
  List<ExerciseCategory> get categories => _categories;

  List<ExerciseInfo> _workouts = [];
  List<ExerciseInfo> get workouts => _workouts;

  int? _selectedCategoryId;
  int? get selectedCategoryId => _selectedCategoryId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  /// Loads categories and workouts together when the page opens.
  Future<void> fetchExplore() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await _service.getCategories();
      _workouts = await _loadWorkouts(_selectedCategoryId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Re-fetches workouts for [categoryId]. Pass `null` to show all.
  Future<void> selectCategory(int? categoryId) async {
    _selectedCategoryId = categoryId;
    _isLoading = true;
    notifyListeners();
    try {
      _workouts = await _loadWorkouts(categoryId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<ExerciseInfo>> _loadWorkouts(int? categoryId) async {
    final exercises = await _service.getExerciseInfoList(categoryId: categoryId);
    return exercises.where((e) => e.images.isNotEmpty).toList();
  }
}
