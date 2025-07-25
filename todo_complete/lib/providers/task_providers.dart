import 'package:flutter/foundation.dart';

import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Buy milk', description: 'From the store'),
    Task(title: 'Walk the dog', description: 'In the park before 7 AM'),
    Task(title: 'Finish Flutter tutorial', description: 'Complete the Provider section'),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description) {
    final task = Task(title: title, description: description);
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
