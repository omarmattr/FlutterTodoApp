import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/ProviderViewModel.dart';
import 'package:provider/provider.dart';
import 'TaskModel.dart';
import 'TaskRaw.dart';

// ignore: must_be_immutable
class Page1 extends StatefulWidget {
  List<TaskModel> array=List();

 // Page1(this.array);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
   myFun() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
   // widget.array.clear();
    //widget.array.addAll(lists);
    return Consumer<ProviderViewModel>(
      builder:(a,value,b) {
       // value.getData();
       print(value.array);
        return SingleChildScrollView(
          child: Column(
            children:value.array.map((e) => TaskRaw(e)).toList(),
          ),
        );
      });
  }
}
