import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app/app_startup.dart';

class FirebaseStatusScreen extends StatelessWidget {
  const FirebaseStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!AppStartup.firebaseReady) {
      return Scaffold(body: SetupNeededMessage(part: 'Par1'));
    }
    final FirebaseApp app = Firebase.app();

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Status')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 12,
          children: [
            Icon(Icons.check_circle, size: 64, color: Colors.green),
            Text('Firebase is connected!'),
            Text('Project id : ${app.options.projectId}'),
            Text('App name : ${app.name}'),
            Text('App id : ${app.options.appId}'),
          ],
        ),
      ),
    );
  }
}

class SetupNeededMessage extends StatelessWidget {
  const SetupNeededMessage({super.key, required this.part});

  final String part;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.link_off, size: 64, color: Colors.orange),
          const SizedBox(height: 16),
          Text(
            '$part needs your own Firebase project',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Run these in the project folder, then STOP and RUN the app again:\n\n'
            '  npm install -g firebase-tools\n'
            '  firebase login\n'
            '  dart pub global activate flutterfire_cli\n'
            '  flutterfire configure\n',
            style: TextStyle(fontFamily: 'monospace', fontSize: 13),
          ),
        ],
      ),
    );
  }
}
