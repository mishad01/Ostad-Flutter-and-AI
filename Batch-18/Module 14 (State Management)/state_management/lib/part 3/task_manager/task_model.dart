import 'package:flutter/material.dart';

class Task {
  Task({this.title = '', this.description = '', this.isDone = false});

  String title;
  String description;
  bool isDone;
}

class TaskModel extends ChangeNotifier {
  final List<Task> _task = [];
  List<Task> get task => _task;

  int get doneCount => _task.where((task) => task.isDone).length;

  void addTask(String title, String des) {
    _task.add(Task(title: title, description: des));
    notifyListeners();
  }

  void removeTask(int index) {
    _task.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) {
    _task[index].isDone = !_task[index].isDone;
    notifyListeners();
  }
}
