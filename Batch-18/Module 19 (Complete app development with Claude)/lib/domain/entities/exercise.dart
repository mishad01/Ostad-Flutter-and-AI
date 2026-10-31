/// Lightweight item from `/exercise/` — related objects are ids only.
class Exercise {
  final int id;
  final String uuid;
  final int categoryId;
  final List<int> muscleIds;
  final List<int> secondaryMuscleIds;
  final List<int> equipmentIds;
  final String licenseAuthor;

  Exercise({
    required this.id,
    required this.uuid,
    required this.categoryId,
    required this.muscleIds,
    required this.secondaryMuscleIds,
    required this.equipmentIds,
    required this.licenseAuthor,
  });
}
