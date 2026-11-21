import '../cache/cache_service.dart';

/// Headers for endpoints that need a logged-in user.
///
/// This API reads the JWT from a plain `token` header (not
/// `Authorization: Bearer`); sending it any other way returns
/// "No token provided".
class AuthHeaders {
  AuthHeaders._();

  static Map<String, String> build() => {
    'accept': 'application/json',
    'token': CacheService.accessToken ?? '',
  };
}
