import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%201/with_provider/counter_model.dart';
import 'package:state_management/part%201/without_provider/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: HomeScreen(),
      ),
    );
  }
}
