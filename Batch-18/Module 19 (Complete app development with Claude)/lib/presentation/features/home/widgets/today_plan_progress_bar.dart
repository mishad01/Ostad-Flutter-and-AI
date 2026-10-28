// WHY: part of today_plan_card.dart — private widget used only by that file.

part of 'today_plan_card.dart';

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Container(height: 28, color: AppColors.progressTrack),
          FractionallySizedBox(
            widthFactor: progress.clamp(0, 1),
            child: Container(
              height: 28,
              color: AppColors.accent,
              alignment: Alignment.center,
              child: Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.cardDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
