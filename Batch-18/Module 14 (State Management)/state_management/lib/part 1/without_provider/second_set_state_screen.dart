import 'package:flutter/material.dart';

class SecondSetStateScreen extends StatefulWidget {
  const SecondSetStateScreen({super.key, required this.count});
  final int count;

  @override
  State<SecondSetStateScreen> createState() => _SecondSetStateScreenState();
}

class _SecondSetStateScreenState extends State<SecondSetStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Set State Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the second screen using setState.'),
            Text('Count passed from previous screen: ${widget.count}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// M -> p1 -> P2
//p2 -> p1 (P1 previous value shows)
//p1 - M -> p1 (Why p1 valu shows 0)
