import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/with_provider/counter_model.dart';

class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Provider Counter'),

            Text(
              'Count ${context.watch<CounterModel>().count}',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().increment();
              },
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().decrement();
                //Read gets the model once and does not listen to changes.
                // So, if you use read instead of watch,
                // the widget will not rebuild when the model changes.
              },
              child: Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().reset();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
