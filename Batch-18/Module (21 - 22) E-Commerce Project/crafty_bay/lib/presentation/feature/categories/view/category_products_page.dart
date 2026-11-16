import 'package:crafty_bay/presentation/core/product_card.dart';
import 'package:crafty_bay/presentation/core/product_grid_page.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/feature/product_details/view/product_details_page.dart';
import 'package:crafty_bay/domain/entities/category.dart';
import 'package:flutter/material.dart';

/// Products of one category, opened by tapping a category tile.
///
/// Shows the sample products until the API can filter by category.
class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key, required this.category});

  final Category category;

  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const ProductDetailsPage(product: DummyData.productDetails),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = DummyData.products;

    return ProductGridPage(
      title: category.title,
      itemCount: products.length,
      itemBuilder: (_, i) => ProductCard(
        image: AssetImage(products[i].imagePath),
        title: products[i].title,
        price: products[i].price,
        rating: products[i].rating,
        onTap: () => _openDetails(context),
      ),
    );
  }
}
