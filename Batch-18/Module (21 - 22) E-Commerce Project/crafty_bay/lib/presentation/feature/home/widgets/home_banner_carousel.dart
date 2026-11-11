import 'package:crafty_bay/presentation/feature/home/widgets/home_banner_slide.dart';
import 'package:crafty_bay/presentation/feature/home/widgets/home_page_indicator.dart';
import 'package:flutter/material.dart';

class HomeBannerCarousel extends StatefulWidget {
  const HomeBannerCarousel({super.key, this.slideCount = 4});

  final int slideCount;

  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            itemCount: widget.slideCount,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (_, _) => const HomeBannerSlide(),
          ),
        ),
        const SizedBox(height: 12),
        HomePageIndicator(
          count: widget.slideCount,
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}
