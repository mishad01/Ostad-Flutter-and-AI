import 'package:crafty_bay/presentation/core/page_indicator.dart';
import 'package:crafty_bay/presentation/feature/home/provider/slide_provider.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_banner_slide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBannerCarousel extends StatefulWidget {
  const HomeBannerCarousel({super.key});

  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  static const double _height = 150;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<SlideProvider>(
      builder: (_, provider, _) {
        if (provider.isLoading && provider.slides.isEmpty) {
          return const SizedBox(
            height: _height,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final slides = provider.slides;
        if (slides.isEmpty) return const SizedBox.shrink();

        return Column(
          children: [
            SizedBox(
              height: _height,
              child: PageView.builder(
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (_, i) => HomeBannerSlide(slide: slides[i]),
              ),
            ),
            const SizedBox(height: 12),
            PageIndicator(count: slides.length, currentIndex: _currentIndex),
          ],
        );
      },
    );
  }
}
