/// Presentation-only product used by cards and grids until the API is wired.
class ProductUiModel {
  const ProductUiModel({
    required this.title,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  final String title;
  final String price;
  final double rating;
  final String imagePath;
}
