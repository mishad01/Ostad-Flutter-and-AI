/// Full detail of one product. [colors] and [sizes] are display names and
/// may be empty when the product has no variants.
class ProductDetails {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final num? regularPrice;
  final num currentPrice;
  final int quantity;

  ProductDetails({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.regularPrice,
    required this.currentPrice,
    required this.quantity,
  });
}
