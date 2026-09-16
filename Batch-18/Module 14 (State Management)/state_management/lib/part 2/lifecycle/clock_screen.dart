import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%202/lifecycle/clock_model.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('ClockScreen disposed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clock')),
      body: Center(
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A model that starts a timer and stops it when the widget is disposed.',
              textAlign: TextAlign.center,
            ),
            Consumer<ClockModel>(
              builder: (context, clock, _) {
                return Text('${clock.seconds} seconds');
              },
            ),
            Text(
              'The provider for the model is inside this screen'
              'not in main.dart, so when we leave this screen the'
              'provider leave the tree and provider calls dispose for us',
              textAlign: TextAlign.center,
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
    );
  }
}
