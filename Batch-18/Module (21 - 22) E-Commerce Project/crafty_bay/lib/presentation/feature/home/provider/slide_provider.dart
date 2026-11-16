import 'package:crafty_bay/data/service/slide_service.dart';
import 'package:crafty_bay/domain/entities/slide.dart';
import 'package:flutter/foundation.dart';

class SlideProvider extends ChangeNotifier {
  final _service = SlideService();

  List<Slide> _slides = [];
  List<Slide> get slides => _slides;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchSlides() async {
    _isLoading = true;
    notifyListeners();
    try {
      _slides = await _service.getSlides();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
