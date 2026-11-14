import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';

/// The app's four-tab bottom navigation: Home, Categories, Cart, Wish.
///
/// Stateless — the parent owns [currentIndex] and reacts to [onTap]. The
/// selected tab is tinted with the brand colour.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.border,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.background,
        elevation: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.iconInactive,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: AppStrings.categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: AppStrings.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: AppStrings.wish,
          ),
        ],
      ),
    );
  }
}
