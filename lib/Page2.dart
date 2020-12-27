import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/ProviderViewModel.dart';
import 'package:provider/provider.dart';
import 'TaskRaw.dart';

// ignore: must_be_immutable
class Page2 extends StatelessWidget {

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
                  .where((element) => element.value == true)
                  .map((e) => TaskRaw(e))
                  .toList(),
            ),
          );
        });
  }
}