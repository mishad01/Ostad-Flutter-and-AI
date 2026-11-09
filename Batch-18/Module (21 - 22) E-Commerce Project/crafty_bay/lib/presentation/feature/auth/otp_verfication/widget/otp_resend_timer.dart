import 'dart:async';

import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';

/// Shows a countdown; once it reaches 0 the "Resend Code" action turns active.
class OtpResendTimer extends StatefulWidget {
  const OtpResendTimer({super.key, this.seconds = 120, this.onResend});

  final int seconds;
  final VoidCallback? onResend;

  @override
  State<OtpResendTimer> createState() => _OtpResendTimerState();
}

class _OtpResendTimerState extends State<OtpResendTimer> {
  Timer? _timer;
  late int _remaining;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remaining = widget.seconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remaining <= 1) t.cancel();
      setState(() => _remaining--);
    });
  }

  void _onResend() {
    widget.onResend?.call();
    setState(_startTimer);
  }

  @override
  Widget build(BuildContext context) {
    final expired = _remaining <= 0;

    return Column(
      children: [
        if (!expired)
          Text.rich(
            TextSpan(
              text: AppStrings.codeExpiresIn,
              style: const TextStyle(color: AppColors.textSecondary),
              children: [
                TextSpan(
                  text: '${_remaining}s',
                  style: const TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: expired ? _onResend : null,
          child: const Text(AppStrings.resendCode),
        ),
      ],
    );
  }
}
