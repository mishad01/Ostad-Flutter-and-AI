import 'package:crafty_bay/data/service/cart_service.dart';
import 'package:crafty_bay/domain/entities/cart_item.dart';
import 'package:flutter/foundation.dart';

/// Owns the cart lines shared by Product Details (add) and the Cart tab.
///
/// Every change goes to the API first; the local list only changes once the
/// server accepted it, so the screen never shows a state the server lacks.
class CartProvider extends ChangeNotifier {
  final _service = CartService();

  List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  /// Total units across all lines (shown on the Cart tab badge).
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get total => _items.fold(
    0,
    (sum, item) => sum + item.price.toDouble() * item.quantity,
  );

  /// Forgets everything (logout), so the next user never sees these lines.
  void clear() {
    _items = [];
    _errorMessage = '';
    notifyListeners();
  }

  Future<void> fetchCart() async {
    _isLoading = true;
    notifyListeners();
    try {
      _items = await _service.getCart();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Adds a product, then reloads the cart so the new line carries its
  /// server id. Returns false (with [errorMessage] set) on failure.
  Future<bool> add({
    required String productId,
    required int quantity,
    String? color,
    String? size,
  }) async {
    try {
      await _service.addToCart(
        productId: productId,
        quantity: quantity,
        color: color,
        size: size,
      );
      _errorMessage = '';
      await fetchCart();

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();

      return false;
    }
  }

  Future<bool> setQuantity(CartItem item, int quantity) async {
    try {
      await _service.updateQuantity(item.id, quantity);
      final index = _items.indexWhere((e) => e.id == item.id);
      if (index != -1) {
        _items[index] = CartItem(
          id: item.id,
          productId: item.productId,
          title: item.title,
          photo: item.photo,
          price: item.price,
          quantity: quantity,
          color: item.color,
          size: item.size,
        );
      }
      _errorMessage = '';
      notifyListeners();

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();

      return false;
    }
  }

  Future<bool> remove(CartItem item) async {
    try {
      await _service.deleteItem(item.id);
      _items.removeWhere((e) => e.id == item.id);
      _errorMessage = '';
      notifyListeners();

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();

      return false;
    }
  }
}
