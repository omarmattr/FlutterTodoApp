import 'package:flutter/widgets.dart';
import 'package:flutter_tabpar/TaskModel.dart';

import 'DB.dart';

class ProviderViewModel extends ChangeNotifier{
  List<TaskModel> array=new List<TaskModel>();
  bool  value =false;
  Future getData()async{
    // array.clear();
    List<TaskModel> newArray=List();
    await MyDatabase.myDatabase.getAllTask().then((value) => value.forEach((element) {
      newArray.add(TaskModel.fromMap(element));
    })).whenComplete(() =>  array.clear()).whenComplete(() =>  array.addAll(newArray)).whenComplete(() => notifyListeners());

   }
   updateTask(TaskModel task) async{
    await MyDatabase.myDatabase.updateTask(task).whenComplete(() =>  notifyListeners());

   }
  deleteTask(int id) async{
    await   MyDatabase.myDatabase.deleteTask(id);
    getData();

  }
  Future insertTask(TaskModel task) async{
    await MyDatabase.myDatabase.insertTask(task);
    getData();

  }

}