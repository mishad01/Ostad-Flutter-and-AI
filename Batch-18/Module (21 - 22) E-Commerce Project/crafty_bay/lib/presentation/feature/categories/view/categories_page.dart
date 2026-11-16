import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/domain/entities/category.dart';
import 'package:crafty_bay/presentation/core/category_card.dart';
import 'package:crafty_bay/presentation/feature/categories/provider/category_provider.dart';
import 'package:crafty_bay/presentation/feature/categories/view/category_products_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// All categories in a 4-column grid under a titled app bar.
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  static const int _columns = 4;
  static const double _labelHeight = 28;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CategoryProvider>(context, listen: false);
    if (provider.categories.isEmpty) {
      Future.microtask(provider.fetchCategories);
    }
  }

  void _openCategory(Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryProductsPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<CategoryProvider>(
        builder: (_, provider, _) {
          if (provider.isLoading && provider.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.errorMessage.isNotEmpty && provider.categories.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(provider.errorMessage),
                  TextButton(
                    onPressed: provider.fetchCategories,
                    child: const Text(AppStrings.retry),
                  ),
                ],
              ),
            );
          }
          final categories = provider.categories;

          return GridView.builder(
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
                iconUrl: categories[i].icon,
                name: categories[i].title,
                size: tileSize,
                onTap: () => _openCategory(categories[i]),
              ),
            ),
          );
        },
      ),
    );
  }
}
