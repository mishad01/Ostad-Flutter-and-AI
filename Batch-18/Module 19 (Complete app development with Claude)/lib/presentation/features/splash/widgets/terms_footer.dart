import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class TermsFooter extends StatelessWidget {
  const TermsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const linkStyle = TextStyle(decoration: TextDecoration.underline);

    return const Text.rich(
      TextSpan(
        style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        children: [
          TextSpan(text: AppStrings.termsPrefix),
          TextSpan(text: AppStrings.terms, style: linkStyle),
          TextSpan(text: AppStrings.and),
          TextSpan(text: AppStrings.privacyPolicy, style: linkStyle),
          TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
