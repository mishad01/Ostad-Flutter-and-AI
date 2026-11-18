import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.photos,
    required super.regularPrice,
    required super.currentPrice,
    required super.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      photos: List<String>.from(json['photos'] ?? const []),
      regularPrice: json['regular_price'],
      currentPrice: json['current_price'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }
}
