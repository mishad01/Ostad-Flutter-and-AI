import 'dart:convert';

import '../../core/end_points.dart';
import '../../domain/entities/wishlist_item.dart';
import '../model/wishlist_item_model.dart';
import 'network/auth_headers.dart';
import 'network/network_caller.dart';

class WishlistService {
  final _networkCaller = NetworkCaller();

  Future<List<WishlistItem>> getWishlist() async {
    final response = await _networkCaller.get(
      Uri.parse(EndPoints.wishlist),
      headers: AuthHeaders.build(),
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
    final data = jsonDecode(response.body!)['data'];
    final list = switch (data) {
      List() => data,
      Map() => data['results'] ?? data['items'] ?? data['wishlist'] ?? const [],
      _ => const [],
    };

    return (list as List)
        .whereType<Map<String, dynamic>>()
        .map(WishlistItemModel.tryFromJson)
        .whereType<WishlistItem>()
        .toList();
  }

  Future<void> addToWishlist(String productId) async {
    final response = await _networkCaller.post(
      Uri.parse(EndPoints.wishlist),
      headers: AuthHeaders.build(),
      body: {'product': productId},
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
  }

  Future<void> deleteItem(String wishlistItemId) async {
    final response = await _networkCaller.delete(
      Uri.parse(EndPoints.wishlistItem(wishlistItemId)),
      headers: AuthHeaders.build(),
    );
    _throwIfFailed(response.isSuccess, response.errorMessage);
  }

  void _throwIfFailed(bool? isSuccess, String? message) {
    if (isSuccess != true) throw Exception(message);
  }
}
