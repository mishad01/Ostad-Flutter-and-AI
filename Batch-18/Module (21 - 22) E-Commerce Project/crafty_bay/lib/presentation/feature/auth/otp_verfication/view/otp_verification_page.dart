import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../complete_profile/view/complete_profile_page.dart';
import '../widget/otp_input_row.dart';
import '../widget/otp_resend_timer.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String _code = '';

  void _onNext() {
    if (_code.length < 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text(AppStrings.otpIncomplete)));
      return;
    }
    // TODO: verify OTP with the API once the auth provider exists.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const CompleteProfilePage()),
    );
  }

  void _onResend() {
    // TODO: request a new OTP.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 80),
              SvgPicture.asset(AppAssets.logo, width: 100),
              const SizedBox(height: 24),
              const Text(
                AppStrings.enterOtpCode,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                AppStrings.otpSentMessage,
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              OtpInputRow(onChanged: (v) => _code = v),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onNext,
                child: const Text(AppStrings.next),
              ),
              const SizedBox(height: 24),
              OtpResendTimer(onResend: _onResend),
            ],
          ),
        ),
      ),
    );
  }
}
