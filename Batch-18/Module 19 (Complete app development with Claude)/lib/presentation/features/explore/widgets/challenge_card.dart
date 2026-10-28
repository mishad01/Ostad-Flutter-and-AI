import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../ui_model/challenge_ui_model.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key, required this.title, required this.icon, required this.style});

  final String title;
  final IconData icon;
  final ChallengeCardStyle style;

  Color get _background => switch (style) {
    ChallengeCardStyle.accent => AppColors.accent,
    ChallengeCardStyle.dark => AppColors.cardDark,
    ChallengeCardStyle.light => AppColors.surface,
  };

  Color get _textColor => switch (style) {
    ChallengeCardStyle.dark => Colors.white,
    _ => AppColors.textPrimary,
  };

  Color get _iconColor => switch (style) {
    ChallengeCardStyle.accent => Colors.white.withValues(alpha: 0.6),
    ChallengeCardStyle.dark => Colors.white.withValues(alpha: 0.45),
    ChallengeCardStyle.light => AppColors.accent.withValues(alpha: 0.6),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(color: _background, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(right: 8, bottom: 8, child: Icon(icon, size: 64, color: _iconColor)),
          Positioned(
            left: 8,
            bottom: 12,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.7,
                color: _textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
