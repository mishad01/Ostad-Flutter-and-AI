import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%201/with_provider/counter_model.dart';
import 'package:state_management/part%201/without_provider/home_screen.dart';
import 'package:state_management/part%203/task_manager/task_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => TaskModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen(),
    );
  }
}
