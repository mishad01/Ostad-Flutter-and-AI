import 'package:crafty_bay/data/service/brand_service.dart';
import 'package:crafty_bay/domain/entities/brand.dart';
import 'package:flutter/foundation.dart';

class BrandProvider extends ChangeNotifier {
  final _service = BrandService();

  List<Brand> _brands = [];
  List<Brand> get brands => _brands;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchBrands() async {
    _isLoading = true;
    notifyListeners();
    try {
      _brands = await _service.getBrands();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
