// WHY: part of workout_hero_header.dart — private widget used only by that file.

part of 'workout_hero_header.dart';

class _StatsPanel extends StatelessWidget {
  const _StatsPanel({required this.minutes, required this.calories});

  final int minutes;
  final int calories;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.darkBackground.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.darkBorder),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _StatItem(
                  icon: Icons.timer_outlined,
                  label: AppStrings.time,
                  value: '$minutes ${AppStrings.minUnitLower}',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: VerticalDivider(color: AppColors.darkBorder, width: 1),
                ),
                _StatItem(
                  icon: Icons.local_fire_department_outlined,
                  label: AppStrings.burn,
                  value: '$calories ${AppStrings.kcalUnitLower}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
