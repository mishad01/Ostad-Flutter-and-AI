import 'package:crafty_bay/data/service/product_service.dart';
import 'package:crafty_bay/domain/entities/product_details.dart';
import 'package:flutter/foundation.dart';

/// Holds one product's details. Created per page (not at the app root) so
/// opening a second product never shows the first one's data.
class ProductDetailsProvider extends ChangeNotifier {
  final _service = ProductService();

  ProductDetails? _product;
  ProductDetails? get product => _product;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchProduct(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _product = await _service.getProductDetails(id);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
