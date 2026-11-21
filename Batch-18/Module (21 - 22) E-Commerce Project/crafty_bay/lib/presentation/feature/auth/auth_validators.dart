import 'package:crafty_bay/core/app_strings.dart';

/// Form validators shared by the login and sign-up pages.
class AuthValidators {
  AuthValidators._();

  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return AppStrings.emailRequired;
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      return AppStrings.emailInvalid;
    }

    return null;
  }

  static String? password(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return AppStrings.passwordRequired;
    if (password.length < 6) return AppStrings.passwordTooShort;

    return null;
  }
}
