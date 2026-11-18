import 'package:crafty_bay/data/service/product_service.dart';
import 'package:crafty_bay/domain/entities/product.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  final _service = ProductService();

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await _service.getProducts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
