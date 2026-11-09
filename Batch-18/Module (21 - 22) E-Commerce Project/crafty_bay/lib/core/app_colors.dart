import 'package:flutter/material.dart';

/// All colors used across the app.
///
/// Never write a raw `Color(0x...)` inside a widget — add the token here
/// and reference it as `AppColors.xxx`.
class AppColors {
  AppColors._();

  // --- Brand ---
  static const Color primary = Color(0xFF21BFBD);
  static const Color primaryDark = Color(0xFF17A2A0);
  static const Color primaryLight = Color(0xFFE4F8F7);
  static const Color logoTeal = Color(0xFF07AEAF);
  static const Color logoOrange = Color(0xFFFE9900);

  // --- Surfaces ---
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color shimmer = Color(0xFFEDEDED);

  // --- Text ---
  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF8A8A8A);
  static const Color textHint = Color(0xFFB0B0B0);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // --- Feedback ---
  static const Color accent = Color(0xFFFFC107);
  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF2E7D32);

  // --- Lines & icons ---
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color icon = Color(0xFF5F5F5F);
  static const Color iconInactive = Color(0xFF9E9E9E);

  // --- Product color swatches (product details page) ---
  static const Color swatchBlack = Color(0xFF212121);
  static const Color swatchBlue = Color(0xFF2962FF);
  static const Color swatchBrown = Color(0xFF8D6E63);
  static const Color swatchGrey = Color(0xFFBDBDBD);
  static const Color swatchDarkGrey = Color(0xFF757575);
}
