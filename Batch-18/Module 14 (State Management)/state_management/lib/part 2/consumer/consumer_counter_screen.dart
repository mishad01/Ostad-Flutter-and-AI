import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%201/with_provider/counter_model.dart';

class ConsumerCounterScreen extends StatefulWidget {
  const ConsumerCounterScreen({super.key});

  @override
  State<ConsumerCounterScreen> createState() => _ConsumerCounterScreenState();
}

class _ConsumerCounterScreenState extends State<ConsumerCounterScreen> {
  int screenBuild = 0;
  int consumerBuild = 0;
  @override
  Widget build(BuildContext context) {
    screenBuild++;
    return Scaffold(
      appBar: AppBar(title: const Text('Consumer Counter Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            Text(
              'Consumer rebuilds only the widget inside it',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Consumer<CounterModel>(
              builder: (context, counter, _) {
                consumerBuild++;
                return Column(
                  children: [
                    Text(
                      "Count ${counter.count}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text('Consumer builds : $consumerBuild'),
                  ],
                );
              },
            ),
            Text('Screen builds: $screenBuild', style: TextStyle(fontSize: 16)),
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
