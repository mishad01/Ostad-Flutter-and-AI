import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/part%203/task_manager/task_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final controller = TextEditingController();
  final desController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    desController.dispose();
    super.dispose();
  }

  void _showAddTaskDialog() {
    controller.clear();
    desController.clear();
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: .min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Enter task title'),
              ),
              TextField(
                controller: desController,
                decoration: const InputDecoration(
                  hintText: 'Enter task details',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text;
                final desText = desController.text;
                if (text.isNotEmpty) {
                  context.read<TaskModel>().addTask(text, desText);
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TaskModel>(
          builder: (context, taskModel, _) {
            return Text('Task ${taskModel.doneCount} done');
          },
        ),
      ),
      body: Consumer<TaskModel>(
        builder: (context, taskModel, _) {
          if (taskModel.task.isEmpty) {
            return Center(child: Text("No task yet. Please add!!"));
          }
          return ListView.builder(
            itemCount: taskModel.task.length,
            itemBuilder: (context, index) {
              final task = taskModel.task[index];
              return ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (value) => taskModel.toggleTask(index),
                ),
                title: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isDone
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 14,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      task.description,
                      style: TextStyle(
                        decoration: task.isDone
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                trailing: IconButton(
                  onPressed: () => taskModel.removeTask(index),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
