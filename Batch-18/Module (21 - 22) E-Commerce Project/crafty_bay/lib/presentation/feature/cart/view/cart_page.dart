import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/domain/entities/cart_item.dart';
import 'package:crafty_bay/presentation/core/image_source.dart';
import 'package:crafty_bay/presentation/core/bottom_action_bar.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_button.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_price.dart';
import 'package:crafty_bay/presentation/feature/cart/provider/cart_provider.dart';
import 'package:crafty_bay/presentation/feature/cart/widgets/cart_item_card.dart';
import 'package:crafty_bay/presentation/feature/cart/widgets/cart_placeholder.dart';
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

  /// "Color: Red, Size: X"; empty when the line has no variant.
  String _details(CartItem item) {
    return [
      if (item.color.isNotEmpty) '${AppStrings.color}: ${item.color}',
      if (item.size.isNotEmpty) '${AppStrings.size}: ${item.size}',
    ].join(', ');
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onQuantityChanged(
    BuildContext context,
    CartProvider cart,
    CartItem item,
    int quantity,
  ) async {
    final ok = await cart.setQuantity(item, quantity);
    if (!ok && context.mounted) _showMessage(context, cart.errorMessage);
  }

  Future<void> _onDelete(
    BuildContext context,
    CartProvider cart,
    CartItem item,
  ) async {
    final ok = await cart.remove(item);
    if (!context.mounted) return;
    _showMessage(context, ok ? AppStrings.removedFromCart : cart.errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

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
      body: cart.items.isEmpty
          ? CartPlaceholder(cart: cart)
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: cart.items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final item = cart.items[i];

                return CartItemCard(
                  image: imageProviderFor(item.photo),
                  title: item.title,
                  details: _details(item),
                  price:
                      '${AppStrings.currencySymbol}${item.price.toStringAsFixed(0)}',
                  quantity: item.quantity,
                  onQuantityChanged: (q) =>
                      _onQuantityChanged(context, cart, item, q),
                  onDelete: () => _onDelete(context, cart, item),
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
          onPressed: cart.items.isEmpty ? null : _onCheckout,
        ),
      ),
    );
  }
}
