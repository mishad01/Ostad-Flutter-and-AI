class AppStartup {
  /// true once `await Firebase.initializeApp(...)` has finished successfully.
  static bool firebaseReady = false;

  /// The error text, if Firebase could not start. Shown to help debugging.
  static String? firebaseError;
}
