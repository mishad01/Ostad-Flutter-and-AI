import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_colors.dart';
import 'core/app_navigator.dart';
import 'core/app_strings.dart';
import 'data/service/cache/cache_service.dart';
import 'data/service/network/session_expired.dart';
import 'presentation/feature/auth/auth_redirect.dart';
import 'presentation/feature/auth/provider/auth_provider.dart';
import 'presentation/feature/home/provider/brand_provider.dart';
import 'presentation/feature/cart/provider/cart_provider.dart';
import 'presentation/feature/categories/provider/category_provider.dart';
import 'presentation/feature/home/provider/product_provider.dart';
import 'presentation/feature/home/provider/slide_provider.dart';
import 'presentation/feature/splash/view/splash_page.dart';
import 'presentation/feature/wishlist/provider/wishlist_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await CacheService.init();
  // Any authenticated request that gets a 401 sends the user to login.
  SessionExpired.onExpired = AuthRedirect.toLogin;
  runApp(const CraftyBayApp());
}

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => SlideProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => BrandProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        navigatorKey: AppNavigator.key,
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.textPrimary),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.background,
            hintStyle: const TextStyle(color: AppColors.textHint),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error),
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
