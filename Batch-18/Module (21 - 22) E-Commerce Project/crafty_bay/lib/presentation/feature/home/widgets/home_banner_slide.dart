import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/domain/entities/slide.dart';
import 'package:flutter/material.dart';

/// One promotional slide: slide image on the left, description and Buy Now.
class HomeBannerSlide extends StatelessWidget {
  const HomeBannerSlide({super.key, required this.slide, this.onBuyNowTap});

  final Slide slide;
  final VoidCallback? onBuyNowTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                slide.photoUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                errorBuilder: (_, _, _) => const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textOnPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slide.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
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
