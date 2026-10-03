import 'package:firebase_project/part%205/notification_details_screen.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static void openDetails(String payload) {
    key.currentState?.push(
      MaterialPageRoute(
        builder: (context) => NotificationDetailsScreen(payload: payload),
      ),
    );
  }
}
