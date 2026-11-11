import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/core/section_header.dart';
import 'package:flutter/material.dart';

/// Reusable home-style section: a title with a "See All" action above a
/// horizontally scrolling row of product cards.
///
/// Used for Popular, Special, New, etc. The caller supplies the [title] and
/// builds each item (normally a `ProductCard` with a fixed `width`) through
/// [itemBuilder], so the section holds no data logic.
class ProductSection extends StatelessWidget {
  const ProductSection({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    this.onSeeAllTap,
    this.seeAllLabel = AppStrings.seeAll,
  });

  final String title;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback? onSeeAllTap;
  final String seeAllLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          onSeeAllTap: onSeeAllTap,
          seeAllLabel: seeAllLabel,
        ),
        // Horizontal scroll view (not ListView) so the row sizes itself to
        // the cards' height — no fixed height to keep in sync.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < itemCount; i++) ...[
                if (i > 0) const SizedBox(width: 12),
                itemBuilder(context, i),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
