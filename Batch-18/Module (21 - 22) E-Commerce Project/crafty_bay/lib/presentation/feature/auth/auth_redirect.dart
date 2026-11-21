import 'package:crafty_bay/core/app_navigator.dart';
import 'package:crafty_bay/presentation/feature/auth/login/view/login_page.dart';
import 'package:flutter/material.dart';

/// Sends the user to the login page and clears the screens behind it.
class AuthRedirect {
  AuthRedirect._();

  // Several requests can fail with 401 at once (cart + wish list at launch);
  // only the first should open the login page.
  static bool _isOpen = false;

  static void toLogin() {
    final navigator = AppNavigator.key.currentState;
    if (_isOpen || navigator == null) return;
    _isOpen = true;
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  /// Called by the login page when it is closed, so the next 401 can redirect again.
  static void reset() => _isOpen = false;
}
