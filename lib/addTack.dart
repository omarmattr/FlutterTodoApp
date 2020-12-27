import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/ProviderViewModel.dart';
import 'package:provider/provider.dart';
import 'TaskModel.dart';

class AddTack extends StatelessWidget {
  String taskName;
 // bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Tack"),
        ),
        body:Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  onChanged: (val) {
                    taskName = val;
                  },
                  decoration: InputDecoration(

                    labelText: "Task name",
                    fillColor: Colors.white70,
                    labelStyle: TextStyle(color: Colors.red),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
    Container(
      child: Consumer<ProviderViewModel>(builder: (a,b,c){
          return Checkbox(
              value: b.value,
              onChanged: (val) {
                b.value = !b.value;
              });
      }),
    )
   ,
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Consumer<ProviderViewModel>(
                  builder:(a,b,c){return RaisedButton(
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color:  Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      child: Center(
                          child: Text(
                            "Add task",
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    onPressed: () {
                      b.insertTask(TaskModel(this.taskName, b.value)).whenComplete(() => Navigator.pop(context));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  );}
                ),
              ),

            ],
          ),
        );
  }
}
