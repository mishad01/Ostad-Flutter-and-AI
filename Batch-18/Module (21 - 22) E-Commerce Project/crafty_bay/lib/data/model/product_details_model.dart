import '../../domain/entities/product_details.dart';

class ProductDetailsModel extends ProductDetails {
  ProductDetailsModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.photos,
    required super.colors,
    required super.sizes,
    required super.regularPrice,
    required super.currentPrice,
    required super.quantity,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'],
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      photos: List<String>.from(json['photos'] ?? const []),
      colors: List<String>.from(json['colors'] ?? const []),
      sizes: List<String>.from(json['sizes'] ?? const []),
      regularPrice: json['regular_price'],
      currentPrice: json['current_price'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }
}
