import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

/// Shown in place of a list while it loads or when loading failed.
///
/// A spinner while [isLoading], otherwise the [errorMessage].
class AsyncPlaceholder extends StatelessWidget {
  const AsyncPlaceholder({
    super.key,
    required this.isLoading,
    required this.errorMessage,
  });

  final bool isLoading;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
    );
  }
}
