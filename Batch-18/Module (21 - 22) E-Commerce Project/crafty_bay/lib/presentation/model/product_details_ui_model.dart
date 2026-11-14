import 'package:flutter/material.dart';

/// Presentation-only product detail used by the Product Details page until the API is wired.
class ProductDetailsUiModel {
  const ProductDetailsUiModel({
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.imagePaths,
    required this.colors,
    required this.sizes,
  });

  final String title;
  final double price;
  final double rating;
  final String description;
  final List<String> imagePaths;
  final List<Color> colors;
  final List<String> sizes;
}
