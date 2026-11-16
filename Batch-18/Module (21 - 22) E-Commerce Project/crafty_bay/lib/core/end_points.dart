/// API URLs. `BASE_URL` is injected at build time from `.env`:
/// `flutter run --dart-define-from-file=.env`
class EndPoints {
  EndPoints._();

  static const String baseUrl = String.fromEnvironment('BASE_URL');
}
