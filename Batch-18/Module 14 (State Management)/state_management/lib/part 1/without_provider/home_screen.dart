import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%201/with_provider/provider_counter_screen.dart';
import 'package:state_management/part%201/without_provider/set_state_counter_screen.dart';
import 'package:state_management/part%202/consumer/consumer_counter_screen.dart';
import 'package:state_management/part%202/consumer/watch_counter_screen.dart';
import 'package:state_management/part%202/lifecycle/clock_model.dart';
import 'package:state_management/part%202/lifecycle/clock_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider VS Set State')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a demo screen to compare Provider and SetState',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetStateCounterScreen(),
                  ),
                );
              },
              child: Text('Without Provider (SetState)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderCounterScreen(),
                  ),
                );
              },
              child: Text('With Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WatchCounterScreen()),
                );
              },
              child: Text('Watch Counter Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsumerCounterScreen(),
                  ),
                );
              },
              child: Text('Consumer Counter Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => ClockModel(),
                      child: ClockScreen(),
                    ),
                  ),
                );
              },
              child: Text('Clock Screen (Lifecycle)'),
            ),
          ],
        ),
      ),
    );
  }
}
