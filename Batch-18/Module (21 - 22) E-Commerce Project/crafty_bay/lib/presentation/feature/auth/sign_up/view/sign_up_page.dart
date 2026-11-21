import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../auth_validators.dart';
import '../../complete_profile/widget/profile_text_field.dart';
import '../../otp_verfication/view/otp_verification_page.dart';
import '../../provider/auth_provider.dart';

/// Creates the account (name, email, password), then asks for the emailed OTP.
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _onLogin() => Navigator.pop(context);

  Future<void> _onSignUp() async {
    if (!_formKey.currentState!.validate()) return;
    final auth = context.read<AuthProvider>();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final ok = await auth.signUp(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: email,
      password: password,
    );
    if (!mounted) return;
    if (!ok) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(auth.errorMessage)));
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => OtpVerificationPage(email: email, password: password),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

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
                SvgPicture.asset(AppAssets.logo, width: 90, height: 90),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.createAccount,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  AppStrings.signUpSubtitle,
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
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: AuthValidators.email,
                  decoration: const InputDecoration(
                    hintText: AppStrings.emailAddress,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  validator: AuthValidators.password,
                  onFieldSubmitted: (_) => _onSignUp(),
                  decoration: InputDecoration(
                    hintText: AppStrings.password,
                    suffixIcon: IconButton(
                      onPressed: _toggleObscure,
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.iconInactive,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isLoading ? null : _onSignUp,
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(AppStrings.signUp),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _onLogin,
                  child: const Text.rich(
                    TextSpan(
                      text: AppStrings.haveAccountPrompt,
                      style: TextStyle(color: AppColors.textSecondary),
                      children: [
                        TextSpan(
                          text: AppStrings.login,
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
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
