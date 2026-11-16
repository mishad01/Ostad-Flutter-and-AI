import 'package:crafty_bay/data/service/category_service.dart';
import 'package:crafty_bay/domain/entities/category.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class CategoryProvider extends ChangeNotifier {
  final _service = CategoryService();

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await _service.getCategories();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
