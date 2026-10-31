// WHY: part of popular_workout_card.dart — private widget used only by that file.

part of 'popular_workout_card.dart';

class _PlayButton extends StatelessWidget {
  const _PlayButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: AppColors.accent,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.play_arrow_rounded,
          color: AppColors.cardDark,
          size: 26,
        ),
      ),
    );
  }
}
