import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/domain/entities/brand.dart';
import 'package:crafty_bay/presentation/core/category_card.dart';
import 'package:crafty_bay/presentation/core/product_section.dart';
import 'package:flutter/material.dart';

/// "Brand" header followed by a horizontally scrolling row of brand tiles.
class HomeBrandSection extends StatelessWidget {
  const HomeBrandSection({
    super.key,
    required this.brands,
    this.onSeeAllTap,
    this.onBrandTap,
  });

  final List<Brand> brands;
  final VoidCallback? onSeeAllTap;
  final ValueChanged<Brand>? onBrandTap;

  @override
  Widget build(BuildContext context) {
    final tileSize = CategoryCard.tileSize(context);

    return ProductSection(
      title: AppStrings.brand,
      onSeeAllTap: onSeeAllTap,
      itemCount: brands.length,
      itemBuilder: (_, i) => CategoryCard(
        iconUrl: brands[i].icon,
        name: brands[i].title,
        size: tileSize,
        onTap: () => onBrandTap?.call(brands[i]),
      ),
    );
  }
}
