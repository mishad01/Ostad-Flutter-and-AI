import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../complete_profile/view/complete_profile_page.dart';
import '../widget/otp_input_row.dart';
import '../../provider/auth_provider.dart';
import '../widget/otp_resend_timer.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    super.key,
    required this.email,
    required this.password,
  });

  /// Account being verified; the OTP was emailed here.
  final String email;

  /// Used to log in right after verification if the server returns no token.
  final String password;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String _code = '';

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onNext() async {
    if (_code.length < 4) {
      _showMessage(AppStrings.otpIncomplete);
      return;
    }
    final auth = context.read<AuthProvider>();
    final ok = await auth.verifyOtp(
      email: widget.email,
      password: widget.password,
      otp: _code,
    );
    if (!mounted) return;
    if (!ok) {
      _showMessage(auth.errorMessage);
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const CompleteProfilePage()),
    );
  }

  Future<void> _onResend() async {
    final auth = context.read<AuthProvider>();
    final ok = await auth.resendOtp(widget.email);
    if (!mounted || ok) return;
    _showMessage(auth.errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

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
                onPressed: isLoading ? null : _onNext,
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(AppStrings.next),
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
