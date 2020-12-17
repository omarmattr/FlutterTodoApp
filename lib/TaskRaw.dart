import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/DB.dart';
import 'package:flutter_tabpar/TaskModel.dart';
import 'package:flutter_tabpar/updateData.dart';

// ignore: must_be_immutable
class TaskRaw extends StatefulWidget {
  TaskModel task;
  Function function;

  TaskRaw(this.task, this.function);

  @override
  _TaskRawState createState() => _TaskRawState();
}

class _TaskRawState extends State<TaskRaw> {

  @override
  Widget build(BuildContext context) {

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

                           // _showSnackBar(context, "Task has been Deleted");
                            MyDatabase.myDatabase.deleteTask(this.widget.task.id);
                            update().whenComplete(() =>  widget.function());

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
        Container(width: 100, child: Center(child: Text(widget.task.taskName))),
        Checkbox(
            value: widget.task.value,
            onChanged: (value) {
              this.widget.task.value = !this.widget.task.value;
              MyDatabase.myDatabase.updateTask(this.widget.task);
              widget.function();
            }),

      ],
    ));
  }
}
