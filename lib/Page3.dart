import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProviderViewModel.dart';
import 'TaskRaw.dart';
// ignore: must_be_immutable
class Page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // widget.array.clear();
    //widget.array.addAll(lists);
    return Consumer<ProviderViewModel>(
        builder: (a, value, b) {
         // value.getData();
          print(value.array);
          return SingleChildScrollView(
            child: Column(
              children: value.array
                  .where((element) => element.value == false)
                  .map((e) => TaskRaw(e))
                  .toList(),
            ),
          );
        });
  }
}