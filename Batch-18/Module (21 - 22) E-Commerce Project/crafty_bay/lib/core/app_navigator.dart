import 'package:flutter/widgets.dart';

/// Lets code without a BuildContext (e.g. the 401 handler) navigate.
class AppNavigator {
  AppNavigator._();

  static final key = GlobalKey<NavigatorState>();
}
