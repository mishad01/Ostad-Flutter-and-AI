class WorkoutUiModel {
  const WorkoutUiModel({
    required this.title,
    required this.imageUrl,
    required this.calories,
    required this.minutes,
  });

  final String title;
  final String imageUrl;
  final int calories;
  final int minutes;
}
