import 'package:flutter/material.dart';
import 'package:state_management/part%201/with_provider/provider_counter_screen.dart';
import 'package:state_management/part%201/without_provider/set_state_counter_screen.dart';
import 'package:state_management/part%202/consumer/watch_counter_screen.dart';
import 'package:state_management/part%202/lifecycle/clock_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Class')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          const Text(
            'Choose a demo screen.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Part 1 — Provider Package'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProviderCounterScreen(),
                ),
              );
            },
            child: const Text('Open Provider screen'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SetStateCounterScreen(),
                ),
              );
            },
            child: const Text('Open setState screen'),
          ),
          const SizedBox(height: 32),dcf
          const _SectionTitle('Part 2 — Advanced Provider'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WatchCounterScreen(),
                ),
              );
            },
            child: const Text('1. Consumer vs watch'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClockScreen()),
              );
            },
            child: const Text('2. Lifecycle and dispose'),
          ),
          const SizedBox(height: 12),
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
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
