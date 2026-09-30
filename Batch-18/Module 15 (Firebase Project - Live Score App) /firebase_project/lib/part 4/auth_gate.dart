import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/app_startup.dart';
import 'package:firebase_project/part%201/firebase_status_screen.dart';
import 'package:firebase_project/part%204/login_screen.dart';
import 'package:firebase_project/part%204/profile_screen.dart';
import 'package:firebase_project/part%204/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    if (!AppStartup.firebaseReady) {
      return Scaffold(body: SetupNeededMessage(part: 'Part 5'));
    }
    //Login // Profile
    return StreamBuilder(
      stream: AuthService.authChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final User? user = snapshot.data;

        if (user == null) {
          return LoginScreen();
        }

        return ProfileScreen(user: user);
      },
    );
  }
}
