/// Lets the network layer tell the UI "the login is no longer valid"
/// without importing any UI code.
///
/// `main.dart` sets [onExpired] to a function that opens the login page.
class SessionExpired {
  SessionExpired._();

  static void Function()? onExpired;
}
