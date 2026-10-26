import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../core/primary_button.dart';
import '../../../core/secondary_button.dart';
import '../widgets/splash_header.dart';
import '../widgets/terms_footer.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _onCreateAccount() {
    // TODO: navigate to sign-up page once it exists.
  }

  void _onLogIn() {
    // TODO: navigate to log-in page once it exists.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              const Spacer(flex: 5),
              const SplashHeader(),
              const Spacer(flex: 4),
              PrimaryButton(
                label: AppStrings.createAccount,
                onPressed: _onCreateAccount,
              ),
              const SizedBox(height: 12),
              SecondaryButton(label: AppStrings.logIn, onPressed: _onLogIn),
              const SizedBox(height: 24),
              const TermsFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
