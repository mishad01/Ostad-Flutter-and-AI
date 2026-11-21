/// All string constants: app name, API endpoints, tokens and static copy.
class AppStrings {
  AppStrings._();

  // --- App ---
  static const String appName = 'CraftyBay';
  static const String appVersion = 'Version 1.0';

  // --- Network ---
  static const String baseUrl = 'https://ecom-rs8e.onrender.com/api/v1';
  static const String authorizationToken = '';
  static const String accessTokenCacheKey = 'access_token';
  static const String networkTimeoutError =
      'Request timed out. Please try again.';
  static const String networkNoInternetError =
      'No internet connection. Please check your network.';
  static const String networkUnexpectedError = 'Something went wrong';
  static const String networkServerError = 'Server error';

  // --- Login ---
  static const String welcomeBack = 'Welcome Back';
  static const String enterEmailPrompt = 'Please Enter Your Email Address';
  static const String signUpSubtitle = 'Create your account';
  static const String emailAddress = 'Email Address';
  static const String password = 'Password';
  static const String passwordRequired = 'Please enter your password';
  static const String passwordTooShort =
      'Password must be at least 6 characters';
  static const String next = 'Next';
  static const String login = 'Login';
  static const String signUp = 'Sign Up';
  static const String createAccount = 'Create Account';
  static const String noAccountPrompt = "Don't have an account? ";
  static const String haveAccountPrompt = 'Already have an account? ';
  static const String skip = 'Skip';
  static const String loginRequired = 'Please log in to continue';
  static const String emailRequired = 'Please enter your email';
  static const String emailInvalid = 'Please enter a valid email';

  // --- OTP ---
  static const String enterOtpCode = 'Enter OTP Code';
  static const String otpSentMessage = 'A 4 Digit OTP Code has been Sent';
  static const String otpIncomplete = 'Please enter the 4 digit code';
  static const String codeExpiresIn = 'This code will expire in ';
  static const String resendCode = 'Resend Code';

  // --- Complete profile ---
  static const String completeProfile = 'Complete Profile';
  static const String completeProfileSubtitle =
      'Get started with us with your details';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String mobile = 'Mobile';
  static const String city = 'City';
  static const String shippingAddress = 'Shipping Address';
  static const String complete = 'Complete';
  static const String fieldRequired = 'This field is required';

  // --- Create review ---
  static const String createReview = 'Create Review';
  static const String writeReview = 'Write Review';
  static const String submit = 'Submit';

  // --- Common copy ---
  static const String search = 'Search';
  static const String seeAll = 'See All';
  static const String allCategories = 'All Categories';
  static const String brand = 'Brand';
  static const String product = 'Product';
  static const String newArrival = 'New';

  // --- Home ---
  static const String bannerTitle = 'Happy New Year\nSpecial Deal\nSave 30%';
  static const String buyNow = 'Buy Now';
  static const String wishList = 'Wish List';
  static const String categories = 'Categories';

  // --- Bottom action bar (cart, product details, reviews) ---
  static const String totalPrice = 'Total Price';
  static const String price = 'Price';
  static const String checkout = 'Checkout';
  static const String addToCart = 'Add To Cart';
  static const String reviews = 'Reviews';

  // --- Bottom navigation ---
  static const String home = 'Home';
  static const String wish = 'Wish';

  // --- Product details ---
  static const String productDetails = 'Product Details';
  static const String color = 'Color';
  static const String size = 'Size';
  static const String description = 'Description';

  static const String addedToCart = 'Added to cart';
  static const String addedToWishlist = 'Added to wish list';
  static const String removedFromWishlist = 'Removed from wish list';
  static const String removedFromCart = 'Removed from cart';

  static const String retry = 'Retry';

  // --- Cart ---
  static const String cart = 'Cart';
  static const String cartEmpty = 'Your cart is empty';
  static const String wishlistEmpty = 'Your wish list is empty';
  static const String currencySymbol = '\$';
}
