import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/category_card.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:flutter/material.dart';

/// All categories in a 4-column grid under a titled app bar.
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  static const int _columns = 4;
  static const double _labelHeight = 28;

  @override
  Widget build(BuildContext context) {
    final categories = DummyData.allCategories;
    final tileSize = CategoryCard.tileSize(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text(
          AppStrings.categories,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _columns,
          mainAxisSpacing: 16,
          mainAxisExtent: tileSize + _labelHeight,
        ),
        itemCount: categories.length,
        // Tile keeps its size, centred in an equal quarter of the width, so
        // spare space becomes spacing — same layout as the home row.
        itemBuilder: (_, i) => Align(
          alignment: Alignment.topCenter,
          child: CategoryCard(
            icon: categories[i].icon,
            name: categories[i].name,
            size: tileSize,
          ),
        ),
      ),
    );
  }
}
