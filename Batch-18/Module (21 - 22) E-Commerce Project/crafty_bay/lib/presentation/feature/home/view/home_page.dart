import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/domain/entities/category.dart';
import 'package:crafty_bay/presentation/data/dummy_data.dart';
import 'package:crafty_bay/presentation/feature/categories/provider/category_provider.dart';
import 'package:crafty_bay/presentation/feature/home/provider/brand_provider.dart';
import 'package:crafty_bay/presentation/feature/home/provider/product_provider.dart';
import 'package:crafty_bay/presentation/feature/home/provider/slide_provider.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_api_product_section.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_brand_section.dart';
import 'package:crafty_bay/presentation/feature/categories/view/categories_page.dart';
import 'package:crafty_bay/presentation/feature/categories/view/category_products_page.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_app_bar.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_banner_carousel.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_category_section.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_product_section.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      Provider.of<SlideProvider>(context, listen: false).fetchSlides();
      Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
      Provider.of<BrandProvider>(context, listen: false).fetchBrands();
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  void _openCategories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CategoriesPage()),
    );
  }

  void _openCategory(BuildContext context, Category category) {
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
            Consumer<CategoryProvider>(
              builder: (_, provider, _) {
                if (provider.isLoading && provider.categories.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return HomeCategorySection(
                  categories: provider.categories,
                  onSeeAllTap: () => _openCategories(context),
                  onCategoryTap: (c) => _openCategory(context, c),
                );
              },
            ),
            const SizedBox(height: 8),
            Consumer<BrandProvider>(
              builder: (_, provider, _) {
                if (provider.isLoading && provider.brands.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return HomeBrandSection(brands: provider.brands);
              },
            ),
            Consumer<ProductProvider>(
              builder: (_, provider, _) {
                if (provider.isLoading && provider.products.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return HomeApiProductSection(
                  title: AppStrings.product,
                  products: provider.products,
                );
              },
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
