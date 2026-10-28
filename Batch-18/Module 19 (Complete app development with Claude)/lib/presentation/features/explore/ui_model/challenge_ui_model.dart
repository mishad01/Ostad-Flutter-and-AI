import 'package:flutter/widgets.dart';

enum ChallengeCardStyle { accent, dark, light }

class ChallengeUiModel {
  const ChallengeUiModel({required this.title, required this.icon, required this.style});

  final String title;
  final IconData icon;
  final ChallengeCardStyle style;
}
