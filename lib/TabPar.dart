
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabpar/addTack.dart';
import 'package:provider/provider.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'ProviderViewModel.dart';


class TabPar extends StatefulWidget {
 // List<TaskModel> list=List();

  TabPar();
  TabController tabController;
  @override
  TabParState createState() => TabParState();
}
class TabParState extends State<TabPar> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
   // widget.list.addAll(lists);
  return DefaultTabController(
    length: 3,
      child: Consumer<ProviderViewModel>(
        builder:(a,b,c){
          b.getData();
          return Scaffold(
          appBar: AppBar(title: Text("Omar"),
            bottom: TabBar(
              tabs: [
              Tab(child: Text("All task"),), Tab(child: Text("Complete task"),), Tab(child: Text("In complete task"),),
            ],
            ),),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddTack();
              }));
            },
            child: Icon(Icons.add,color: Colors.white,),
            backgroundColor: Colors.blue,
          ),

        );}
      ));
  }

}

