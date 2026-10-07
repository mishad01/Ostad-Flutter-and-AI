import 'package:firebase_project/part%204/auth_gate.dart';
import 'package:firebase_project/part%205/notification_lab_screen.dart';
import 'package:firebase_project/part%206/push_lab_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/part%201/firebase_status_screen.dart';
import 'package:firebase_project/part%202/student_live_screen.dart';
import 'package:firebase_project/part%202/write_data_screen.dart';
import 'package:firebase_project/part%203%20crud/notes_screen.dart';

import 'app_startup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Firebase Class')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          if (!AppStartup.firebaseReady) const _SetupBanner(),

          const _SectionTitle('Part 1 — Firebase Setup'),

          const _DemoButton(
            label: 'Is Firebase connected?',
            screen: FirebaseStatusScreen(),
          ),
          const _SectionTitle('Part 2 — Firestore Basics'),
          const _DemoButton(
            label: '1. Write data — add() vs set()',
            screen: WriteDataScreen(),
          ),
          const _DemoButton(
            label: '2. Read data — get() vs onSnapshot()',
            screen: StudentLiveScreen(),
          ),
          const _SectionTitle('Part 3 — CRUD Operations'),
          const _DemoButton(
            label: '1. Notes CRUD (model + service)',
            screen: NotesScreen(),
          ),
          const _SectionTitle('Part 4 — Login with Email/Google'),
          const _DemoButton(
            label: '1. Login with Email/Google',
            screen: AuthGate(),
          ),
          const _SectionTitle('Part 5 — Notification Lab'),
          const _DemoButton(
            label: '1. Notification Lab',
            screen: NotificationLabScreen(),
          ),
          const _SectionTitle('Part 6 — Push Notification Lab'),
          const _DemoButton(
            label: '1. Push Notification Lab',
            screen: PushLabScreen(),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _DemoButton extends StatelessWidget {
  const _DemoButton({required this.label, required this.screen});

  final String label;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Align(alignment: Alignment.centerLeft, child: Text(label)),
      ),
    );
  }
}

class _SetupBanner extends StatelessWidget {
  const _SetupBanner();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '⚠️  Firebase is not connected yet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'project — do Part 1 first, then stop and run the app again.',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
