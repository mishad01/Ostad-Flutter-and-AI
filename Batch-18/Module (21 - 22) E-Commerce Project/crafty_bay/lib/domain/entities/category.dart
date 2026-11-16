/// A product category. [parent] is the parent category id, `null` for top level.
class Category {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;
  final String? parent;

  Category({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.icon,
    this.parent,
  });
}
