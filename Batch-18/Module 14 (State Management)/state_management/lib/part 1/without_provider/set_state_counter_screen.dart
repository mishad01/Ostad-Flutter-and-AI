import 'package:flutter/material.dart';
import 'package:state_management/part%201/without_provider/second_set_state_screen.dart';

class SetStateCounterScreen extends StatefulWidget {
  const SetStateCounterScreen({super.key});

  @override
  State<SetStateCounterScreen> createState() => _SetStateCounterScreenState();
}

class _SetStateCounterScreenState extends State<SetStateCounterScreen> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
      print('Count incremented to: $count');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set State Counter Screen')),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('T-shirt', textAlign: TextAlign.center),
            Text('Count: $count', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondSetStateScreen(count: count),
                  ),
                );
              },
              child: Text('Click Me'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
