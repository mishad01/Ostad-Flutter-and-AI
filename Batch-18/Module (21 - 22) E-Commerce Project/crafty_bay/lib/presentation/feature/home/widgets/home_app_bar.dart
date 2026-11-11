import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Home top row: logo on the left, profile / call / notification actions.
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
        ],
      ),
    );
  }
}
