/// API URLs. `BASE_URL` is injected at build time from `.env`:
/// `flutter run --dart-define-from-file=.env`
///
/// Customer endpoints only; admin-only routes (create/update/delete of
/// brands, categories, products, slides) are intentionally left out.
class EndPoints {
  EndPoints._();

  static const String baseUrl = String.fromEnvironment('BASE_URL');

  // --- Auth ---
  static const String login = '$baseUrl/auth/login';
  static const String signup = '$baseUrl/auth/signup';
  static const String verifyOtp = '$baseUrl/auth/verify-otp';
  static const String resendOtp = '$baseUrl/auth/resend-otp';
  static const String profile = '$baseUrl/auth/profile'; // GET, PATCH

  // --- Home ---
  static const String slides = '$baseUrl/slides';
  static const String brands = '$baseUrl/brands';
  static const String categories = '$baseUrl/categories';

  // --- Products ---
  static const String products = '$baseUrl/products';
  static String productBySlug(String slug) => '$baseUrl/products/$slug';
  static String productById(String id) => '$baseUrl/products/id/$id';

  // --- Reviews ---
  static const String reviews = '$baseUrl/reviews'; // GET ?product=<id>
  static const String createReview = '$baseUrl/review';
  static String review(String id) => '$baseUrl/reviews/$id'; // PATCH, DELETE

  // --- Cart ---
  static const String cart = '$baseUrl/cart'; // GET, POST
  static String cartItem(String id) => '$baseUrl/cart/$id'; // PATCH, DELETE

  // --- Wishlist ---
  static const String wishlist = '$baseUrl/wishlist'; // GET, POST
  static String wishlistItem(String id) => '$baseUrl/wishlist/$id'; // DELETE

  // --- Orders ---
  static const String orders = '$baseUrl/orders'; // GET
  static const String createOrder = '$baseUrl/order';
  static String order(String id) => '$baseUrl/orders/$id';
  static String cancelOrder(String id) => '$baseUrl/orders/$id/cancel'; // PATCH
}
