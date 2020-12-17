import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/updateData.dart';

import 'DB.dart';
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
    widget.array.clear();
    widget.array.addAll(lists);
    return Column(
      children: widget.array.map((e) => TaskRaw(e, myFun)).toList(),
    );
  }
}
