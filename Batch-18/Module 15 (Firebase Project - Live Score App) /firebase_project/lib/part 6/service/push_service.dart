import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_project/app_navigator.dart';
import 'package:flutter/material.dart';

//(vm: entry point)

class PushService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final ValueNotifier<List<RemoteMessage>> foreGroundMessage =
      ValueNotifier<List<RemoteMessage>>([]);

  static Future<void> init() async {
    //Asks the user to allow notifications
    final NotificationSettings settings = await _messaging.requestPermission(
      sound: true,
      alert: true,
      badge: true,
    );

    debugPrint('Foreground message : ${settings.authorizationStatus}');

    //1. Fcm gives us the message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground message : ${message.messageId} ${message.data}');
      foreGroundMessage.value = [...foreGroundMessage.value, message];
    });

    //2. App in background -> We tapped the notification
    FirebaseMessaging.onMessageOpenedApp.listen(_openFromMessage);

    getToken();
  }

  //. App is terminated : Then we launch the app

  static Future<void> handleLaunchMessage() async {
    final RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _openFromMessage(initialMessage);
    }
  }

  static void _openFromMessage(RemoteMessage remote) {
    AppNavigator.openDetails(remote.data['screen'] ?? 'push');
  }

  static Future<String?> getToken() async {
    final String? token = await _messaging.getToken();
    debugPrint('FCM Token : $token');
    return token;
  }
}
