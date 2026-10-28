// WHY: part of explore_workout_tile.dart — private widget used only by that file.

part of 'explore_workout_tile.dart';

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.tagBackground,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
      ),
    );
  }
}
