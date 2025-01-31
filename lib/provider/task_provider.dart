import 'package:flutter/cupertino.dart';
import 'package:to_do_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];

  void addTask(TaskModel task) {
    taskList.add(task);
    notifyListeners();
  }

  void editTask({required int taskIndex, required String taskTitle}) {
    taskList[taskIndex].title = taskTitle;
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    taskList[index].isDone = !taskList[index].isDone;
    notifyListeners();
  }
}
