// WHY: part of onboarding_hero_image.dart — private widget used only by that file.

part of 'onboarding_hero_image.dart';

class _HeroPlaceholder extends StatelessWidget {
  const _HeroPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.cardDark, AppColors.primary],
        ),
      ),
      child: const Center(
        child: Icon(Icons.directions_run_rounded, size: 64, color: AppColors.accent),
      ),
    );
  }
}
