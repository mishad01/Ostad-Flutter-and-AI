import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/category_card.dart';
import 'package:crafty_bay/presentation/core/section_header.dart';
import 'package:crafty_bay/presentation/model/category_ui_model.dart';
import 'package:flutter/material.dart';

/// "All Categories" header followed by a horizontal row of category tiles.
class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
    required this.categories,
    this.onSeeAllTap,
  });

  final List<CategoryUiModel> categories;
  final VoidCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    // 16px page padding on both sides + three 12px gaps → four tiles span
    // the full width. More than four categories scroll horizontally.
    final tileSize = (MediaQuery.sizeOf(context).width - 50 - 50) / 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: AppStrings.allCategories,
          onSeeAllTap: onSeeAllTap,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final category in categories) ...[
                if (category != categories.first) const SizedBox(width: 12),
                CategoryCard(
                  icon: category.icon,
                  name: category.name,
                  size: tileSize,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
