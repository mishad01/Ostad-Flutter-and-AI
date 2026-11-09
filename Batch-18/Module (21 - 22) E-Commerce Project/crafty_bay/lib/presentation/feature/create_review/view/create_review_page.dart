import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:flutter/material.dart';

class CreateReviewPage extends StatefulWidget {
  const CreateReviewPage({super.key});

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) return AppStrings.fieldRequired;
    return null;
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: submit review to the API once the review provider exists.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          AppStrings.createReview,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  validator: _validateRequired,
                  decoration: const InputDecoration(
                    hintText: AppStrings.firstName,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  validator: _validateRequired,
                  decoration: const InputDecoration(
                    hintText: AppStrings.lastName,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _reviewController,
                  maxLines: 8,
                  textInputAction: TextInputAction.newline,
                  validator: _validateRequired,
                  decoration: const InputDecoration(
                    hintText: AppStrings.writeReview,
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onSubmit,
                  child: const Text(AppStrings.submit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
