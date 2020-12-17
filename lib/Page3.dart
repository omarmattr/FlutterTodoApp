import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/updateData.dart';
import 'TaskModel.dart';
import 'TaskRaw.dart';
// ignore: must_be_immutable
class Page3 extends StatefulWidget{
  List<TaskModel> array=List();
 // Page3(this.array);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  myFun(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    widget.array.clear();
    widget.array.addAll(lists);
    return  Column(
      children: widget.array.where((element) => element.value==false).map((e) => TaskRaw(e,myFun)).toList(),
    );

  }
}