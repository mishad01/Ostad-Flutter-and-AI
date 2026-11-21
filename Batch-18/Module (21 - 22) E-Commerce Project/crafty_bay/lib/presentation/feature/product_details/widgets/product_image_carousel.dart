import 'package:crafty_bay/presentation/core/image_source.dart';
import 'package:crafty_bay/presentation/core/page_indicator.dart';
import 'package:flutter/material.dart';

/// Swipeable product photos with a dot indicator underneath.
class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, required this.imagePaths});

  final List<String> imagePaths;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            itemCount: widget.imagePaths.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image(
                image: imageProviderFor(widget.imagePaths[i]),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        PageIndicator(
          count: widget.imagePaths.length,
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}
