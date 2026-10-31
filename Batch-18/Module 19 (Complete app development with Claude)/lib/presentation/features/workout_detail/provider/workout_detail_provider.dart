import 'package:flutter/foundation.dart';

import '../../../../data/service/exercise_service.dart';
import '../../../../domain/entities/exercise_info.dart';

/// Owns the state of the Workout detail screen: one fully expanded exercise
/// (muscles, equipment, images, translations).
class WorkoutDetailProvider extends ChangeNotifier {
  final _service = ExerciseService();

  ExerciseInfo? _exercise;
  ExerciseInfo? get exercise => _exercise;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchExercise(int id) async {
    _exercise = null;
    _isLoading = true;
    notifyListeners();
    try {
      _exercise = await _service.getExerciseInfo(id);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
