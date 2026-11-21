import '../../domain/entities/wishlist_item.dart';
import 'product_model.dart';

class WishlistItemModel extends WishlistItem {
  WishlistItemModel({required super.id, required super.product});

  /// Returns null when the product was not populated (nothing to show).
  static WishlistItemModel? tryFromJson(Map<String, dynamic> json) {
    final product = json['product'];
    if (product is! Map<String, dynamic>) return null;

    return WishlistItemModel(
      id: json['_id'].toString(),
      product: ProductModel.fromJson(product),
    );
  }
}
