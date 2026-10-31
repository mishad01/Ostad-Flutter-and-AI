class ExerciseImage {
  final int id;
  final String imageUrl;
  final String thumbnailSmallUrl;
  final String thumbnailMediumUrl;
  final bool isMain;

  ExerciseImage({
    required this.id,
    required this.imageUrl,
    required this.thumbnailSmallUrl,
    required this.thumbnailMediumUrl,
    required this.isMain,
  });
}
