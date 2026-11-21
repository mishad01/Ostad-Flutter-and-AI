import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/image_source.dart';
import 'package:crafty_bay/presentation/core/bottom_action_bar.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_button.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_price.dart';
import 'package:crafty_bay/presentation/feature/cart/provider/cart_provider.dart';
import 'package:crafty_bay/presentation/feature/cart/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Cart lines with quantity steppers and a bottom bar showing the total + Checkout.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void _onCheckout() {
    // TODO: start checkout once the order flow exists.
  }

  /// 100000 -> "$100,000.00"
  String _formatMoney(double value) {
    final parts = value.toStringAsFixed(2).split('.');
    final whole = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );

    return '${AppStrings.currencySymbol}$whole.${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final items = cart.items;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text(
          AppStrings.cart,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final item = items[i];

          return CartItemCard(
            image: imageProviderFor(item.imagePath),
            title: item.title,
            details: item.details,
            price:
                '${AppStrings.currencySymbol}${item.price.toStringAsFixed(0)}',
            quantity: item.quantity,
            onQuantityChanged: (q) => cart.setQuantity(i, q),
            onDelete: () => cart.removeAt(i),
          );
        },
      ),
      bottomNavigationBar: BottomActionBar(
        leading: BottomBarPrice(
          label: AppStrings.totalPrice,
          value: _formatMoney(cart.total),
        ),
        action: BottomBarButton(
          label: AppStrings.checkout,
          onPressed: items.isEmpty ? null : _onCheckout,
        ),
      ),
    );
  }
}
