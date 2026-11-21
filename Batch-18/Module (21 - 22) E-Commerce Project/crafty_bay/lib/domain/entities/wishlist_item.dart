import 'product.dart';

/// One wished product. [id] is the wishlist item id used to delete it.
class WishlistItem {
  final String id;
  final Product product;

  WishlistItem({required this.id, required this.product});
}
