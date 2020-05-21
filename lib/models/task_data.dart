import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection'; //for unmodidiablelist

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Exercise'),
    Task(name: 'Practice Flutter'),
    Task(name: 'Complete Google IT Course'),
    Task(name: 'Dance'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  //another version of list (this prevents from changing private prop lists from Provider.of )
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  //changing tasks data requires method cause we have tp notify listeners
  //thats why tasks are set private

  void addNewTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleCompleted();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
