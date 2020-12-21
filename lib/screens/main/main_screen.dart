import 'package:TodoApp/screens/main/widgets/week_tasks.dart';
import 'package:TodoApp/screens/main/widgets/bottom_bar.dart';
import 'package:TodoApp/screens/main/widgets/categories.dart';
import 'package:TodoApp/screens/main/widgets/drawer.dart';
import 'package:TodoApp/screens/main/widgets/header.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {},
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Header(),
          ),
          Expanded(
            flex: 2,
            child: Categories(),
          ),
          Expanded(
            flex: 5,
            child: WeekTasks(),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
      floatingActionButton: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
