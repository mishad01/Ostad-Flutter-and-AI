import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%201/with_provider/counter_model.dart';

class WatchCounterScreen extends StatefulWidget {
  const WatchCounterScreen({super.key});

  @override
  State<WatchCounterScreen> createState() => _WatchCounterScreenState();
}

class _WatchCounterScreenState extends State<WatchCounterScreen> {
  int screenBuild = 0;
  @override
  Widget build(BuildContext context) {
    screenBuild++;
    return Scaffold(
      appBar: AppBar(title: const Text('Watch Counter Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            Text(
              'context.watch rebuilds everything',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Counter: ${context.watch<CounterModel>().count}',
              style: TextStyle(fontSize: 24),
            ),
            Text('Screen builds: $screenBuild', style: TextStyle(fontSize: 16)),
            Text(
              'We call context.watch inside build. That make this entire widget listen , so the scaffold, the appbar and every text below are build again on every tap ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterModel>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
