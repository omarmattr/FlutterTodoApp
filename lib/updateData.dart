import 'DB.dart';
import 'TaskModel.dart';

Future update()async{
  lists.clear();
  List<TaskModel> array=List();
  await MyDatabase.myDatabase.getAllTask().then((value) => value.forEach((element) {
    array.add(TaskModel.fromMap(element));
  })).whenComplete(() =>  lists.addAll(array));
}
List<TaskModel> lists=List();