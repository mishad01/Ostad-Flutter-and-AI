/// Presentation-only cart line used by the Cart page until the API is wired.
class CartItemUiModel {
  const CartItemUiModel({
    required this.title,
    required this.details,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  final String title;

  /// Variant summary, e.g. "Color: Red, Size: X".
  final String details;

  /// Unit price.
  final double price;
  final String imagePath;
  final int quantity;

  CartItemUiModel copyWith({int? quantity}) {
    return CartItemUiModel(
      title: title,
      details: details,
      price: price,
      imagePath: imagePath,
      quantity: quantity ?? this.quantity,
    );
  }
}
