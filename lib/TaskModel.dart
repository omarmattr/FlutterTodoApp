import 'package:flutter_tabpar/DB.dart';

class TaskModel {
  int id;
  String taskName;
  bool value;

  TaskModel(this.taskName, this.value);

  static toMap(TaskModel taskModel) {
    return {
      MyDatabase.columnTaskName: taskModel.taskName,
      MyDatabase.columnTaskValueName: taskModel.value ? 1 : 0
    };
  }

  static TaskModel fromMap(Map map) {
    bool value;
    if (map[MyDatabase.columnTaskValueName] == 1)
      value = true;
    else
      value = false;
    var task = TaskModel(map[MyDatabase.columnTaskName], value);
    task.id = map[MyDatabase.columnIdName];
    return task;
  }
}
