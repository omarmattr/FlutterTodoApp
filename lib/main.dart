import 'package:flutter/material.dart';
import 'package:flutter_tabpar/ProviderViewModel.dart';
import 'package:flutter_tabpar/TabPar.dart';
import 'package:provider/provider.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
//wait update();
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
    return  ChangeNotifierProvider<ProviderViewModel>(
        create: (context){
      return ProviderViewModel();
    },
    child:MaterialApp(home:TabPar())
    ,);
  }
}


