import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/models/task.dart';

class TaskProvider with ChangeNotifier {
  final Box<Task> _tasksBox = Hive.box<Task>('tasks');

  List<Task> get tasks => _tasksBox.values.toList();

  void addTask(Task task) {
    _tasksBox.put(task.id, task); // Store task with ID as key
    notifyListeners();
  }

  void updateTask(String id, Task updatedTask) {
    _tasksBox.put(id, updatedTask);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasksBox.delete(id);
    notifyListeners();
  }

  void toggleTaskCompletion(String id) {
    final task = _tasksBox.get(id);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      _tasksBox.put(id, task);
      notifyListeners();
    }
  }

  List<Task> getPendingTasks() {
    return _tasksBox.values.where((task) => !task.isCompleted).toList();
  }

  List<Task> getCompletedTasks() {
    return _tasksBox.values.where((task) => task.isCompleted).toList();
  }
}