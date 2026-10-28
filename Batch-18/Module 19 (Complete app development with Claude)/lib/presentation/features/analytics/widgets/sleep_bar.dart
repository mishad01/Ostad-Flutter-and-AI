// WHY: part of sleep_card.dart — private widget used only by that file.

part of 'sleep_card.dart';

class _SleepBar extends StatelessWidget {
  const _SleepBar({required this.level});

  final double level;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: AppColors.sleepTrack,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        heightFactor: level.clamp(0, 1),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.sleepBar,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
