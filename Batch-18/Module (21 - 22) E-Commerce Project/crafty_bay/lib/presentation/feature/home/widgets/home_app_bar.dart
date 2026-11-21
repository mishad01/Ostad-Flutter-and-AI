import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/presentation/feature/auth/auth_redirect.dart';
import 'package:crafty_bay/presentation/feature/auth/provider/auth_provider.dart';
import 'package:crafty_bay/presentation/feature/cart/provider/cart_provider.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_circle_icon_button.dart';
import 'package:crafty_bay/presentation/feature/wishlist/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

/// Home top row: logo on the left, profile / call / notification / logout actions.
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  Future<void> _onLogout(BuildContext context) async {
    final auth = context.read<AuthProvider>();
    final cart = context.read<CartProvider>();
    final wishlist = context.read<WishlistProvider>();
    await auth.logout();
    cart.clear();
    wishlist.clear();
    AuthRedirect.toLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.logoNav, height: 28),
          const Spacer(),
          const HomeCircleIconButton(icon: Icons.person_outline),
          const SizedBox(width: 8),
          const HomeCircleIconButton(icon: Icons.call_outlined),
          const SizedBox(width: 8),
          const HomeCircleIconButton(icon: Icons.notifications_none),
          const SizedBox(width: 8),
          HomeCircleIconButton(
            icon: Icons.logout,
            onTap: () => _onLogout(context),
          ),
        ],
      ),
    );
  }
}
