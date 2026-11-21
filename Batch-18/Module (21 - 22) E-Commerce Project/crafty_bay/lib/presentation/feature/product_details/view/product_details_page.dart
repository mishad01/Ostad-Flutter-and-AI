import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/bottom_action_bar.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_button.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_price.dart';
import 'package:crafty_bay/presentation/core/quantity_stepper.dart';
import 'package:crafty_bay/presentation/feature/cart/provider/cart_provider.dart';
import 'package:crafty_bay/presentation/feature/product_details/widgets/color_selector.dart';
import 'package:crafty_bay/presentation/feature/product_details/widgets/product_image_carousel.dart';
import 'package:crafty_bay/presentation/feature/product_details/widgets/product_rating_row.dart';
import 'package:crafty_bay/presentation/feature/product_details/widgets/size_selector.dart';
import 'package:crafty_bay/presentation/feature/reviews/view/reviews_page.dart';
import 'package:crafty_bay/presentation/model/cart_item_ui_model.dart';
import 'package:crafty_bay/presentation/model/product_details_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Product photos, title, quantity, rating, colour/size pickers, description,
/// and a bottom bar with the price and Add To Cart.
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final ProductDetailsUiModel product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  static const _sectionStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  int _quantity = 1;
  int _colorIndex = 0;
  int _sizeIndex = 0;
  bool _isWished = false;

  void _onReviewsTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ReviewsPage()),
    );
  }

  void _onWishTap() => setState(() => _isWished = !_isWished);

  void _onAddToCart() {
    final product = widget.product;
    final variants = [
      if (product.colorNames.isNotEmpty)
        '${AppStrings.color}: ${product.colorNames[_colorIndex]}',
      if (product.sizes.isNotEmpty)
        '${AppStrings.size}: ${product.sizes[_sizeIndex]}',
    ];

    context.read<CartProvider>().add(
      CartItemUiModel(
        title: product.title,
        details: variants.join(', '),
        price: product.price,
        imagePath: product.imagePaths.isEmpty ? '' : product.imagePaths.first,
        quantity: _quantity,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text(AppStrings.addedToCart)));
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text(
          AppStrings.productDetails,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          ProductImageCarousel(imagePaths: product.imagePaths),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              QuantityStepper(
                quantity: _quantity,
                onChanged: (q) => setState(() => _quantity = q),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ProductRatingRow(
            rating: product.rating,
            isWished: _isWished,
            onReviewsTap: _onReviewsTap,
            onWishTap: _onWishTap,
          ),
          const SizedBox(height: 16),
          if (product.colors.isNotEmpty) ...[
            const Text(AppStrings.color, style: _sectionStyle),
            const SizedBox(height: 8),
            ColorSelector(
              colors: product.colors,
              selectedIndex: _colorIndex,
              onSelected: (i) => setState(() => _colorIndex = i),
            ),
            const SizedBox(height: 16),
          ],
          if (product.sizes.isNotEmpty) ...[
            const Text(AppStrings.size, style: _sectionStyle),
            const SizedBox(height: 8),
            SizeSelector(
              sizes: product.sizes,
              selectedIndex: _sizeIndex,
              onSelected: (i) => setState(() => _sizeIndex = i),
            ),
            const SizedBox(height: 16),
          ],
          const Text(AppStrings.description, style: _sectionStyle),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomActionBar(
        leading: BottomBarPrice(
          label: AppStrings.price,
          value:
              '${AppStrings.currencySymbol}${(product.price * _quantity).toStringAsFixed(0)}',
        ),
        action: BottomBarButton(
          label: AppStrings.addToCart,
          onPressed: _onAddToCart,
        ),
      ),
    );
  }
}
