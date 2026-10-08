// THE MENU — one button per topic of the course.
//
// Nothing here is maps code. It only uses Navigator.push to open each
// demo screen, exactly like you already know from earlier classes.

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Google Maps Class')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        children: const [_SectionTitle('Part 1 — Info Windows, Gestures')],
      ),
    );
  }
}

class _SetupNote extends StatelessWidget {
  const _SetupNote();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'New to maps? Open Part 3 first — it builds the map the other parts '
          'decorate.\n\n'
          'A gray square means the API key is still the placeholder. Replace '
          'YOUR_GOOGLE_MAPS_API_KEY, then stop the app and run it again.',
          style: TextStyle(fontSize: 13),
        ),
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
