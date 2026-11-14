import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/bottom_action_bar.dart';
import 'package:crafty_bay/presentation/core/bottom_bar_circle_button.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/feature/create_review/view/create_review_page.dart';
import 'package:crafty_bay/presentation/feature/reviews/widgets/review_card.dart';
import 'package:flutter/material.dart';

/// List of product reviews with a bottom bar showing the count and an add button.
class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  void _onAddReview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateReviewPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reviews = DummyData.reviews;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text(
          AppStrings.reviews,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, i) =>
            ReviewCard(name: reviews[i].name, comment: reviews[i].comment),
      ),
      bottomNavigationBar: BottomActionBar(
        leading: const Text(
          '${AppStrings.reviews} (${DummyData.reviewCount})',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        action: BottomBarCircleButton(onPressed: () => _onAddReview(context)),
      ),
    );
  }
}
