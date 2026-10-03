import 'package:firebase_project/app_navigator.dart';
import 'package:firebase_project/part%205/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/app_startup.dart';
import 'package:firebase_project/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    AppStartup.firebaseReady = true;
  } catch (e) {
    AppStartup.firebaseError = e.toString();
  }

  await NotificationService.init();

  if (AppStartup.firebaseReady) {
    try {
      await GoogleSignIn.instance.initialize();
    } catch (e) {
      debugPrint('Google Sign In not configured $e');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomeScreen(),
      navigatorKey: AppNavigator.key,
    );
  }
}
