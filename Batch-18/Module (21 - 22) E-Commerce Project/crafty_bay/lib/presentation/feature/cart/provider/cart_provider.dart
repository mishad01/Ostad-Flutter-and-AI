import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/model/cart_item_ui_model.dart';
import 'package:flutter/foundation.dart';

/// Owns the cart lines shared by Product Details (add) and the Cart tab.
///
/// Starts with the sample items until the cart API is wired.
class CartProvider extends ChangeNotifier {
  final List<CartItemUiModel> _items = List.of(DummyData.cartItems);

  List<CartItemUiModel> get items => List.unmodifiable(_items);

  double get total =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  /// Adds [item]; if the same product + variant is already in the cart,
  /// its quantity is increased instead of adding a duplicate line.
  void add(CartItemUiModel item) {
    final index = _items.indexWhere(
      (e) => e.title == item.title && e.details == item.details,
    );
    if (index == -1) {
      _items.add(item);
    } else {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + item.quantity,
      );
    }
    notifyListeners();
  }

  void setQuantity(int index, int quantity) {
    _items[index] = _items[index].copyWith(quantity: quantity);
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
