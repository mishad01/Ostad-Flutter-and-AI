import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';

/// Star rating, a teal "Reviews" link and the wishlist heart button.
class ProductRatingRow extends StatelessWidget {
  const ProductRatingRow({
    super.key,
    required this.rating,
    required this.isWished,
    required this.onReviewsTap,
    required this.onWishTap,
  });

  final double rating;
  final bool isWished;
  final VoidCallback onReviewsTap;
  final VoidCallback onWishTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, size: 20, color: AppColors.accent),
        const SizedBox(width: 4),
        Text(
          rating.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: onReviewsTap,
          child: const Text(
            AppStrings.reviews,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: onWishTap,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              isWished ? Icons.favorite : Icons.favorite_border,
              size: 16,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
