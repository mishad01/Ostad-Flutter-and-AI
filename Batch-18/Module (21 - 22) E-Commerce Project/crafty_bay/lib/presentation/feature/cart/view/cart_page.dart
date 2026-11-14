import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/bottom_action_bar.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_button.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_price.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/feature/cart/widgets/cart_item_card.dart';
import 'package:crafty_bay/presentation/model/cart_item_ui_model.dart';
import 'package:flutter/material.dart';

/// Cart lines with quantity steppers and a bottom bar showing the total + Checkout.
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<CartItemUiModel> _items;

  @override
  void initState() {
    super.initState();
    _items = List.of(DummyData.cartItems);
  }

  double get _total =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void _onQuantityChanged(int index, int quantity) {
    setState(() => _items[index] = _items[index].copyWith(quantity: quantity));
  }

  void _onDelete(int index) {
    setState(() => _items.removeAt(index));
  }

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
        itemCount: _items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final item = _items[i];

          return CartItemCard(
            image: AssetImage(item.imagePath),
            title: item.title,
            details: item.details,
            price: '${AppStrings.currencySymbol}${item.price.toStringAsFixed(0)}',
            quantity: item.quantity,
            onQuantityChanged: (q) => _onQuantityChanged(i, q),
            onDelete: () => _onDelete(i),
          );
        },
      ),
      bottomNavigationBar: BottomActionBar(
        leading: BottomBarPrice(
          label: AppStrings.totalPrice,
          value: _formatMoney(_total),
        ),
        action: BottomBarButton(
          label: AppStrings.checkout,
          onPressed: _items.isEmpty ? null : _onCheckout,
        ),
      ),
    );
  }
}
