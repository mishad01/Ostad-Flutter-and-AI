import 'package:crafty_bay/data/service/auth_service.dart';
import 'package:crafty_bay/data/service/cache/cache_service.dart';
import 'package:flutter/foundation.dart';

/// Drives login, sign-up, OTP and profile screens.
///
/// Every action returns true on success; on failure it returns false and
/// [errorMessage] holds the server's message, ready for a snackbar.
class AuthProvider extends ChangeNotifier {
  final _service = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  /// Removes the saved token. Callers then open the login page.
  Future<void> logout() => CacheService.clearAccessToken();

  Future<bool> login({required String email, required String password}) {
    return _run(() async {
      final token = await _service.login(email: email, password: password);
      await CacheService.saveAccessToken(token);
    });
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return _run(
      () => _service.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      ),
    );
  }

  /// Verifies the OTP, then makes sure a token is saved: uses the one the
  /// server returned, or logs in with [password] when it returned none.
  Future<bool> verifyOtp({
    required String email,
    required String password,
    required String otp,
  }) {
    return _run(() async {
      var token = await _service.verifyOtp(email: email, otp: otp);
      token ??= await _service.login(email: email, password: password);
      await CacheService.saveAccessToken(token);
    });
  }

  Future<bool> resendOtp(String email) => _run(() => _service.resendOtp(email));

  Future<bool> updateProfile({
    required String phone,
    required String city,
    required String shippingAddress,
  }) {
    return _run(
      () => _service.updateProfile(
        phone: phone,
        city: city,
        shippingAddress: shippingAddress,
      ),
    );
  }

  Future<bool> _run(Future<void> Function() action) async {
    _isLoading = true;
    notifyListeners();
    try {
      await action();
      _errorMessage = '';

      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');

      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
