/// One line of the user's cart. [id] is the cart item id used to delete or
/// update the line; [productId] is the product it points at.
class CartItem {
  final String id;
  final String productId;
  final String title;
  final String photo;
  final num price;
  final int quantity;
  final String color;
  final String size;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.photo,
    required this.price,
    required this.quantity,
    required this.color,
    required this.size,
  });

  /// "Color: Red, Size: X" style summary is built in the UI; this only says
  /// whether the line has any variant at all.
  bool get hasVariant => color.isNotEmpty || size.isNotEmpty;
}
