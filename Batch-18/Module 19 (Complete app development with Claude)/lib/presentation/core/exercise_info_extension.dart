import '../../core/app_strings.dart';
import '../../domain/entities/exercise_info.dart';

/// Turns raw wger data into values the UI can show directly.
///
/// The API has no duration, calorie or difficulty fields, so those three are
/// estimated from how many muscles the exercise works.
extension ExerciseInfoUi on ExerciseInfo {
  static const int _englishLanguageId = 2;

  String get title {
    if (translations.isEmpty) return '';
    final english = translations.where(
      (t) => t.languageId == _englishLanguageId,
    );

    return (english.isNotEmpty ? english.first : translations.first).name;
  }

  /// The description arrives as HTML (`<ol><li>...`), so strip the tags.
  String get plainDescription {
    if (translations.isEmpty) return '';
    final english = translations.where(
      (t) => t.languageId == _englishLanguageId,
    );
    final html =
        (english.isNotEmpty ? english.first : translations.first).description;

    return html
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'[ \t]+'), ' ')
        .trim();
  }

  /// About half of wger's exercises have no image, so this can be empty.
  String get mainImageUrl {
    if (images.isEmpty) return '';

    return images
        .firstWhere((i) => i.isMain, orElse: () => images.first)
        .imageUrl;
  }

  int get _musclesWorked => muscles.length + secondaryMuscles.length;

  int get estimatedMinutes => 10 + 5 * _musclesWorked;

  int get estimatedCalories => estimatedMinutes * 10;

  String get level => switch (_musclesWorked) {
    <= 2 => AppStrings.levelBeginner,
    3 => AppStrings.levelIntermediate,
    _ => AppStrings.levelExpert,
  };
}
