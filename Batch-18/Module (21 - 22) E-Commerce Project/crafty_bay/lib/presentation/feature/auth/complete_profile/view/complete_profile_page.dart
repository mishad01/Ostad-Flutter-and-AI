import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/feature/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/profile_text_field.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _onComplete() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: submit profile to the API once the auth provider exists.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                SvgPicture.asset(
                  AppAssets.logo,
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.completeProfile,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  AppStrings.completeProfileSubtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                ProfileTextField(
                  controller: _firstNameController,
                  hint: AppStrings.firstName,
                ),
                const SizedBox(height: 12),
                ProfileTextField(
                  controller: _lastNameController,
                  hint: AppStrings.lastName,
                ),
                const SizedBox(height: 12),
                ProfileTextField(
                  controller: _mobileController,
                  hint: AppStrings.mobile,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                ProfileTextField(
                  controller: _cityController,
                  hint: AppStrings.city,
                ),
                const SizedBox(height: 12),
                ProfileTextField(
                  controller: _addressController,
                  hint: AppStrings.shippingAddress,
                  maxLines: 4,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onComplete,
                  child: const Text(AppStrings.complete),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
