import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/feature/categories/view/categories_page.dart';
import 'package:crafty_bay/presentation/feature/categories/view/category_products_page.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_app_bar.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_banner_carousel.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_category_section.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_product_section.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_search_bar.dart';
import 'package:crafty_bay/presentation/model/category_ui_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCategories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CategoriesPage()),
    );
  }

  void _openCategory(BuildContext context, CategoryUiModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryProductsPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            const HomeAppBar(),
            const SizedBox(height: 8),
            const HomeSearchBar(),
            const SizedBox(height: 16),
            const HomeBannerCarousel(),
            const SizedBox(height: 20),
            HomeCategorySection(
              categories: DummyData.categories,
              onSeeAllTap: () => _openCategories(context),
              onCategoryTap: (c) => _openCategory(context, c),
            ),
            const SizedBox(height: 8),
            const HomeProductSection(
              title: AppStrings.popular,
              products: DummyData.products,
            ),
            const HomeProductSection(
              title: AppStrings.special,
              products: DummyData.products,
            ),
            const HomeProductSection(
              title: AppStrings.newArrival,
              products: DummyData.products,
            ),
          ],
        ),
      ),
    );
  }
}
