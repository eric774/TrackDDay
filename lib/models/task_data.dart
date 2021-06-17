import 'package:flutter/foundation.dart';
import 'package:minor_project_1/models/task.dart';
import 'dart:collection';

// import 'package:minor_project_1/screens/allDone.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    // Task(name: 'complete maths assignment', score: 0),
    // Task(name: 'make science project preparations', score: 0),
    // Task(name: 'Task bread', score: 0),
    // Task(name: 'learn conditionals loops', score: 0),
    // Task(name: 'Task 2 ', score: 0),
    // Task(name: 'Task 3', score: 0),
    // Task(name: 'Task 4', score: 0),
    // Task(name: 'Task 4', score: 0),
    // Task(name: 'Task 5', score: 0),
    Task(name: 'Started adding Today\'s tasks', score: 0),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

List allDoneTasks = [];
List archivedTasks = [];
