import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/product_card.dart';
import 'package:crafty_bay/presentation/core/product_grid_page.dart';
import 'package:crafty_bay/presentation/core/product_section.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/feature/product_details/view/product_details_page.dart';
import 'package:crafty_bay/presentation/model/product_ui_model.dart';
import 'package:flutter/material.dart';

/// A titled home row of product cards sized so three fit on screen.
/// "See All" opens the full list in a [ProductGridPage].
class HomeProductSection extends StatelessWidget {
  const HomeProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<ProductUiModel> products;

  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const ProductDetailsPage(product: DummyData.productDetails),
      ),
    );
  }

  void _openAll(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductGridPage(
          title: title,
          itemCount: products.length,
          itemBuilder: (_, i) => ProductCard(
            image: AssetImage(products[i].imagePath),
            title: products[i].title,
            price: products[i].price,
            rating: products[i].rating,
            onTap: () => _openDetails(context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 16px page padding on both sides + two 12px gaps → three cards.
    final cardWidth = (MediaQuery.sizeOf(context).width - 10 - 10) / 3;

    return ProductSection(
      title: title,
      seeAllLabel: AppStrings.seeAll,
      onSeeAllTap: () => _openAll(context),
      itemCount: products.length,
      itemBuilder: (_, i) => ProductCard(
        width: cardWidth,
        image: AssetImage(products[i].imagePath),
        title: products[i].title,
        price: products[i].price,
        rating: products[i].rating,
        onTap: () => _openDetails(context),
      ),
    );
  }
}
