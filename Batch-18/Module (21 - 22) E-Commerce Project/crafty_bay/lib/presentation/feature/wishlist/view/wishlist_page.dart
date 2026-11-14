import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/product_card.dart';
import 'package:crafty_bay/presentation/core/product_grid_page.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:flutter/material.dart';

/// Products the user has wished, shown in the shared product grid.
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = DummyData.products;

    return ProductGridPage(
      title: AppStrings.wishList,
      itemCount: products.length,
      itemBuilder: (_, i) => ProductCard(
        image: AssetImage(products[i].imagePath),
        title: products[i].title,
        price: products[i].price,
        rating: products[i].rating,
        isWished: true,
      ),
    );
  }
}
