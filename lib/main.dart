import 'package:flutter/material.dart';
import 'package:flutter_tabpar/DB.dart';
import 'package:flutter_tabpar/TabPar.dart';
import 'package:flutter_tabpar/TaskModel.dart';
import 'package:flutter_tabpar/updateData.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
await update();
// await MyDatabase.myDatabase.getAllTask().then((value) => value.forEach((element) {
//
//    list.add(TaskModel.fromMap(element));
//  }));
  runApp(MyApp());
 // MyDatabase.myDatabase.insertTask(TaskModel("123", false));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TabPar());
  }
}


