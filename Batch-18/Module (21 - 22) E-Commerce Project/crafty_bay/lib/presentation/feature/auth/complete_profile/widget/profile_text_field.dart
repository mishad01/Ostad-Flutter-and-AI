import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';

/// Required text field used by the complete-profile form.
class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final int maxLines;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      textInputAction: textInputAction,
      validator: (v) =>
          (v == null || v.trim().isEmpty) ? AppStrings.fieldRequired : null,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
