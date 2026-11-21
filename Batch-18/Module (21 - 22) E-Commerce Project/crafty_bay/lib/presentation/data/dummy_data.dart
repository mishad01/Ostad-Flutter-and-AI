import 'package:crafty_bay/core/app_assets.dart';
import 'package:crafty_bay/core/app_colors.dart';
import 'package:crafty_bay/presentation/model/product_details_ui_model.dart';
import 'package:crafty_bay/presentation/model/product_ui_model.dart';
import 'package:crafty_bay/presentation/model/review_ui_model.dart';

/// Placeholder content for UI development. Replace with real data later.
class DummyData {
  DummyData._();

  static const List<ProductUiModel> products = [
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
    ProductUiModel(
      title: 'New Year Special Shoe 30',
      price: '\$100',
      rating: 4.8,
      imagePath: AppAssets.shoe,
    ),
  ];

  /// Total shown in the Reviews bottom bar (the list below is just a sample).
  static const int reviewCount = 1000;

  static const List<ReviewUiModel> reviews = [
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
    ReviewUiModel(name: 'Rabbil Hasan', comment: _loremReview),
  ];

  static const String _loremReview =
      'Reference site about Lorem Ipsum, giving information on its origins, '
      'as well as a random Lipsum generator Reference site about Lorem Ipsum, '
      'giving information on its origins, as well as a random Lipsum generator';

  /// Sample detail shown for any tapped product until the API is wired.
  static const ProductDetailsUiModel productDetails = ProductDetailsUiModel(
    title: 'Happy New Year Special Deal Save 30%',
    price: 1000,
    rating: 4.8,
    description: _loremReview,
    imagePaths: [
      AppAssets.shoe,
      AppAssets.shoe,
      AppAssets.shoe,
      AppAssets.shoe,
    ],
    colors: [
      AppColors.swatchBlack,
      AppColors.swatchBlue,
      AppColors.swatchBrown,
      AppColors.swatchGrey,
      AppColors.swatchDarkGrey,
    ],
    colorNames: ['Black', 'Blue', 'Brown', 'Grey', 'Dark Grey'],
    sizes: ['S', 'M', 'L', 'XL'],
  );
}
