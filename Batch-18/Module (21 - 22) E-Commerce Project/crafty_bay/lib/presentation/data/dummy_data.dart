import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/presentation/model/cart_item_ui_model.dart';
import 'package:crafty_bay/presentation/model/category_ui_model.dart';
import 'package:crafty_bay/presentation/model/product_ui_model.dart';
import 'package:crafty_bay/presentation/model/review_ui_model.dart';
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

  /// The four sample categories repeated, to fill the Categories page grid.
  static final List<CategoryUiModel> allCategories = List.generate(
    16,
    (i) => categories[i % categories.length],
  );

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

  /// Total shown in the Reviews bottom bar (the list below is just a sample).
  static const int reviewCount = 1000;

  static const List<ReviewUiModel> reviews = [
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
  ];

  static const String _loremReview =
      'Reference site about Lorem Ipsum, giving information on its origins, '
      'as well as a random Lipsum generator Reference site about Lorem Ipsum, '
      'giving information on its origins, as well as a random Lipsum generator';

  static const List<CartItemUiModel> cartItems = [
    CartItemUiModel(
      title: 'New Year Special Shoe',
      details: 'Color: Red, Size: X',
      price: 100,
      imagePath: AppAssets.shoe,
    ),
    CartItemUiModel(
      title: 'New Year Special Shoe',
      details: 'Color: Red, Size: X',
      price: 100,
      imagePath: AppAssets.shoe,
    ),
    CartItemUiModel(
      title: 'New Year Special Shoe',
      details: 'Color: Red, Size: X',
      price: 100,
      imagePath: AppAssets.shoe,
    ),
    CartItemUiModel(
      title: 'New Year Special Shoe',
      details: 'Color: Red, Size: X',
      price: 100,
      imagePath: AppAssets.shoe,
    ),
  ];
}
