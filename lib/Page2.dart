import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/updateData.dart';
import 'TaskModel.dart';
import 'TaskRaw.dart';

// ignore: must_be_immutable
class Page2 extends StatefulWidget {
  List<TaskModel> array=List();

 // Page2(this.array);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.array.clear();
    widget.array.addAll(lists);
    return Column(
      children: widget.array
          .where((element) => element.value == true)
          .map((e) => TaskRaw(e, myFun))
          .toList(),
    );
  }
}
