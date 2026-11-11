import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/category_card.dart';
import 'package:crafty_bay/presentation/core/section_header.dart';
import 'package:crafty_bay/presentation/model/category_ui_model.dart';
import 'package:flutter/material.dart';

/// "All Categories" header followed by a row of up to four category tiles.
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
    final tileSize = CategoryCard.tileSize(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: AppStrings.allCategories,
          onSeeAllTap: onSeeAllTap,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          // Each tile sits centred in an equal quarter of the width, so the
          // spare space becomes even spacing without enlarging the tiles.
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final category in categories.take(4))
                Expanded(
                  child: Center(
                    child: CategoryCard(
                      icon: category.icon,
                      name: category.name,
                      size: tileSize,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
