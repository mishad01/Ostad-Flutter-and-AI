import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';

/// One promotional slide: shoe image on the left, offer text and Buy Now.
class HomeBannerSlide extends StatelessWidget {
  const HomeBannerSlide({super.key, this.onBuyNowTap});

  final VoidCallback? onBuyNowTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(child: Image.asset(AppAssets.shoe, fit: BoxFit.contain)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppStrings.bannerTitle,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textOnPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: onBuyNowTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.background,
                    foregroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.background,
                    disabledForegroundColor: AppColors.primary,
                    minimumSize: const Size(110, 32),
                    elevation: 0,
                  ),
                  child: const Text(
                    AppStrings.buyNow,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
