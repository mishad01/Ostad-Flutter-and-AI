import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/presentation/model/category_ui_model.dart';
import 'package:crafty_bay/presentation/model/product_ui_model.dart';
import 'package:flutter/material.dart';

/// Placeholder content for UI development. Replace with real data later.
class DummyData {
  DummyData._();

  static const List<CategoryUiModel> categories = [
    CategoryUiModel(name: 'Electronics', icon: Icons.desktop_windows_outlined),
    CategoryUiModel(name: 'Food', icon: Icons.local_pizza_outlined),
    CategoryUiModel(name: 'Fashion', icon: Icons.diamond_outlined),
    CategoryUiModel(name: 'Furniture', icon: Icons.bed_outlined),
  ];

  static const List<ProductUiModel> products = [
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
  ];
}
