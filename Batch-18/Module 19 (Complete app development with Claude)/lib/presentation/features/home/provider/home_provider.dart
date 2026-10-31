import 'package:flutter/foundation.dart';

import '../../../../data/service/exercise_service.dart';
import '../../../../domain/entities/exercise_info.dart';

/// Owns the state of the Home screen: the "Popular workouts" list.
///
/// The page never calls the service itself. It calls [fetchPopularWorkouts],
/// then rebuilds when [notifyListeners] fires.
class HomeProvider extends ChangeNotifier {
  final _service = ExerciseService();

  List<ExerciseInfo> _popularWorkouts = [];
  List<ExerciseInfo> get popularWorkouts => _popularWorkouts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchPopularWorkouts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final exercises = await _service.getExerciseInfoList();
      // About half of wger's exercises have no image, so drop them to avoid empty cards.
      _popularWorkouts = exercises.where((e) => e.images.isNotEmpty).toList();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
