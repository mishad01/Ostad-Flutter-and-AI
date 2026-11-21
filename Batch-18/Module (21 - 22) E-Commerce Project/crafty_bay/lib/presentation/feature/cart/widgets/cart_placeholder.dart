import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/feature/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';

/// Shown instead of the cart list when it has no lines: a spinner while
/// loading, otherwise the error (with Retry) or "cart is empty".
class CartPlaceholder extends StatelessWidget {
  const CartPlaceholder({super.key, required this.cart});

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    if (cart.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            cart.errorMessage.isEmpty
                ? AppStrings.cartEmpty
                : cart.errorMessage,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          TextButton(
            onPressed: cart.fetchCart,
            child: const Text(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}
