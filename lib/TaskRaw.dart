import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/TaskModel.dart';
import 'package:provider/provider.dart';

import 'ProviderViewModel.dart';

// ignore: must_be_immutable
class TaskRaw extends StatelessWidget {
  TaskModel task;
  Function function;
  TaskRaw(this.task);
  @override
  Widget build(BuildContext context) {
    // widget.array.clear();
    //widget.array.addAll(lists);
    return Consumer<ProviderViewModel>(
        builder:(a,pro,b) {
          return Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    alignment: Alignment.centerRight,
                    icon: new Icon(Icons.delete),
                    color: Colors.redAccent,
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Confirm Delete"),
                              content: Text("Are you sure you want to Delete Task ?"),
                              actions: [
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: () async {
                                    pro.deleteTask(task.id);
                                   // update().whenComplete(() =>  widget.function());

                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });


                    },
                  ),
                  Container(width: 100, child: Center(child: Text(task.taskName))),
                  Checkbox(
                      value: task.value,
                      onChanged: (value) {
                        task.value = !task.value;
                        pro.updateTask(task);

                       // widget.function();
                      }),

                ],
              ));
  },);
  }
}
