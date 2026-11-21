import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/product_card.dart';
import 'package:crafty_bay/presentation/core/product_grid_page.dart';
import 'package:crafty_bay/presentation/feature/product_details/view/product_details_api_page.dart';
import 'package:crafty_bay/presentation/feature/wishlist/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Products the user has wished, shown in the shared product grid.
/// Tapping a card's heart removes it from the wish list.
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  void _openDetails(BuildContext context, String productId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsApiPage(productId: productId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>();
    final items = wishlist.items;

    if (items.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            AppStrings.wishList,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Center(
          child: wishlist.isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      wishlist.errorMessage.isEmpty
                          ? AppStrings.wishlistEmpty
                          : wishlist.errorMessage,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                    TextButton(
                      onPressed: wishlist.fetchWishlist,
                      child: const Text(AppStrings.retry),
                    ),
                  ],
                ),
        ),
      );
    }

    return ProductGridPage(
      title: AppStrings.wishList,
      itemCount: items.length,
      itemBuilder: (_, i) {
        final product = items[i].product;

        return ProductCard(
          image: NetworkImage(
            product.photos.isNotEmpty ? product.photos.first : '',
          ),
          title: product.title,
          price: '${AppStrings.currencySymbol}${product.currentPrice}',
          isWished: true,
          onTap: () => _openDetails(context, product.id),
          onWishTap: () => wishlist.remove(items[i]),
        );
      },
    );
  }
}
