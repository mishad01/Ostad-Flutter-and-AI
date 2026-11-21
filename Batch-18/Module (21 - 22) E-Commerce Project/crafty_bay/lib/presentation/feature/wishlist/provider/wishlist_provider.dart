import 'package:crafty_bay/data/service/wishlist_service.dart';
import 'package:crafty_bay/domain/entities/wishlist_item.dart';
import 'package:flutter/foundation.dart';

/// Owns the wished products. Shared by every heart button (home, details)
/// and the Wish List tab, so they always agree on what is wished.
class WishlistProvider extends ChangeNotifier {
  final _service = WishlistService();

  List<WishlistItem> _items = [];
  List<WishlistItem> get items => List.unmodifiable(_items);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool isWished(String productId) =>
      _items.any((e) => e.product.id == productId);

  /// Forgets everything (logout), so the next user never sees these items.
  void clear() {
    _items = [];
    _errorMessage = '';
    notifyListeners();
  }

  Future<void> fetchWishlist() async {
    _isLoading = true;
    notifyListeners();
    try {
      _items = await _service.getWishlist();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Heart tap: removes the product when wished, adds it otherwise.
  /// Returns false (with [errorMessage] set) on failure.
  Future<bool> toggle(String productId) async {
    final existing = _items.where((e) => e.product.id == productId);

    return existing.isEmpty ? _add(productId) : remove(existing.first);
  }

  Future<bool> remove(WishlistItem item) async {
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

  // Reloads after adding because the new line's id comes from the server.
  Future<bool> _add(String productId) async {
    try {
      await _service.addToWishlist(productId);
      _errorMessage = '';
      await fetchWishlist();

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();

      return false;
    }
  }
}
