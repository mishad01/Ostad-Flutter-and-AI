import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/core/app_strings.dart';
import 'package:crafty_bay/presentation/feature/product_details/provider/product_details_provider.dart';
import 'package:crafty_bay/presentation/feature/product_details/view/product_details_page.dart';
import 'package:crafty_bay/presentation/model/product_details_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Loads one product by [productId] from the API, then shows it in a
/// [ProductDetailsPage]. Shows a spinner while loading and a retry on error.
class ProductDetailsApiPage extends StatelessWidget {
  const ProductDetailsApiPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailsProvider()..fetchProduct(productId),
      child: Consumer<ProductDetailsProvider>(
        builder: (context, provider, _) {
          final product = provider.product;
          if (product != null) {
            return ProductDetailsPage(
              product: ProductDetailsUiModel.fromEntity(product),
            );
          }

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.background,
              elevation: 0,
              iconTheme: const IconThemeData(color: AppColors.textPrimary),
            ),
            body: Center(
              child: provider.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          provider.errorMessage,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        TextButton(
                          onPressed: () => provider.fetchProduct(productId),
                          child: const Text(AppStrings.retry),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
