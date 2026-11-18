/// A product from the catalogue. [photos] are network image URLs.
class Product {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final num? regularPrice;
  final num currentPrice;
  final int quantity;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.regularPrice,
    required this.currentPrice,
    required this.quantity,
  });
}
