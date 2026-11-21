import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/domain/entities/product.dart';
import 'package:crafty_bay/presentation/core/product_card.dart';
import 'package:crafty_bay/presentation/core/product_grid_page.dart';
import 'package:crafty_bay/presentation/core/product_section.dart';
import 'package:crafty_bay/presentation/feature/product_details/view/product_details_api_page.dart';
import 'package:crafty_bay/presentation/feature/wishlist/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Home row of API products, sized so three cards fit on screen.
/// "See All" opens the full list in a [ProductGridPage].
class HomeApiProductSection extends StatelessWidget {
  const HomeApiProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<Product> products;

  void _openDetails(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsApiPage(productId: product.id),
      ),
    );
  }

  // Consumer (not context.watch) because this also runs inside the pushed
  // "See All" route, where the section's own context is not building.
  Widget _card(BuildContext context, Product p, {double? width}) {
    return Consumer<WishlistProvider>(
      builder: (context, wishlist, _) => ProductCard(
        width: width,
        image: NetworkImage(p.photos.isNotEmpty ? p.photos.first : ''),
        title: p.title,
        price: '\$${p.currentPrice}',
        isWished: wishlist.isWished(p.id),
        onTap: () => _openDetails(context, p),
        onWishTap: () => wishlist.toggle(p.id),
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
          itemBuilder: (_, i) => _card(context, products[i]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = (MediaQuery.sizeOf(context).width - 10 - 10) / 3;

    return ProductSection(
      title: title,
      seeAllLabel: AppStrings.seeAll,
      onSeeAllTap: () => _openAll(context),
      itemCount: products.length,
      itemBuilder: (_, i) => _card(context, products[i], width: cardWidth),
    );
  }
}
