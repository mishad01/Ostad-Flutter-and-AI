import 'package:flutter/material.dart';
import 'package:state_management/without_provider/set_state_counter_Screen.dart';

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
            ElevatedButton(onPressed: () {}, child: Text('Click Me')),
          ],
        ),
      ),
    );
  }
}
