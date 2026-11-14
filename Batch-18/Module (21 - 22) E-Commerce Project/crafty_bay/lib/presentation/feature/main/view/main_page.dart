import 'package:crafty_bay/presentation/core/app_bottom_nav_bar.dart';
import 'package:crafty_bay/presentation/feature/cart/provider/cart_provider.dart';
import 'package:crafty_bay/presentation/feature/cart/view/cart_page.dart';
import 'package:crafty_bay/presentation/feature/categories/view/categories_page.dart';
import 'package:crafty_bay/presentation/feature/home/view/home_page.dart';
import 'package:crafty_bay/presentation/feature/wishlist/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// App shell: hosts the four tabs and the shared [AppBottomNavBar].
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onTabSelected(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps every tab alive so scroll position and cart edits
      // survive switching tabs.
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomePage(),
          const CategoriesPage(),
          const CartPage(),
          const WishlistPage(),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
        cartCount: context.watch<CartProvider>().itemCount,
      ),
    );
  }
}
