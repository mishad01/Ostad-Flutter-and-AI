import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WriteDataScreen extends StatelessWidget {
  const WriteDataScreen({super.key});

  //Add Students
  Future<void> addStudents(BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('students').add({
        'name': 'Sabbir Ahmed',
        'age': 20,
        'isActive': true,
        'subjects': ['Math', 'English'],
        'createdAt': DateTime.now(),
      });
      print('Firestore write success');
    } catch (e, st) {
      print('Firestore write failed: $e');
      print(st);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added Sabbir Ahmed with an automatic ID')),
    );
  }

  //Set Students
  Future<void> setStudents(BuildContext context) async {
    await FirebaseFirestore.instance.collection('students').doc('abir').set({
      'name': 'Abir Rahaman',
      'age': 20,
      'isActive': true,
      'subjects': ['Math', 'English'],
      'createdAt': DateTime.now(),
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Abir with id "abir"')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Write Data')),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Write data to Firestore'),
            ElevatedButton(
              onPressed: () => addStudents(context),
              child: Text('add() - Add Sabbir Ahmed with an automatic ID'),
            ),
            ElevatedButton(
              onPressed: () => setStudents(context),
              child: Text('set() - Set Abir Rahaman with id "abir"'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
