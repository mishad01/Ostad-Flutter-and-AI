import 'dart:convert';

import '../../core/end_points.dart';
import '../../domain/entities/cart_item.dart';
import '../model/cart_item_model.dart';
import 'network/auth_headers.dart';
import 'network/network_caller.dart';

class CartService {
  final _networkCaller = NetworkCaller();

  Future<List<CartItem>> getCart() async {
    final response = await _networkCaller.get(
      Uri.parse(EndPoints.cart),
      headers: AuthHeaders.build(),
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
    final data = jsonDecode(response.body!)['data'];
    final list = switch (data) {
      List() => data,
      Map() => data['results'] ?? data['items'] ?? data['cart'] ?? const [],
      _ => const [],
    };

    return (list as List)
        .whereType<Map<String, dynamic>>()
        .map(CartItemModel.fromJson)
        .toList();
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
    String? color,
    String? size,
  }) async {
    final response = await _networkCaller.post(
      Uri.parse(EndPoints.cart),
      headers: AuthHeaders.build(),
      body: {
        'product': productId,
        'quantity': quantity,
        'color': ?color,
        'size': ?size,
      },
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
  }

  Future<void> updateQuantity(String cartItemId, int quantity) async {
    final response = await _networkCaller.patch(
      Uri.parse(EndPoints.cartItem(cartItemId)),
      headers: AuthHeaders.build(),
      body: {'quantity': quantity},
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
  }

  Future<void> deleteItem(String cartItemId) async {
    final response = await _networkCaller.delete(
      Uri.parse(EndPoints.cartItem(cartItemId)),
      headers: AuthHeaders.build(),
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
  }

  void _throwIfFailed(bool? isSuccess, String? message) {
    if (isSuccess != true) throw Exception(message);
  }
}
