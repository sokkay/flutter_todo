import 'package:TodoApp/screens/edit_taks/edit_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:TodoApp/routes/routes_names.dart';

import 'package:TodoApp/screens/main/main_screen.dart';

Route<dynamic> appRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.mainScreen:
      return MaterialPageRoute(
        builder: (context) => MainScreen(),
        settings: RouteSettings(name: RouteNames.mainScreen),
      );
    case RouteNames.editScreen:
      return MaterialPageRoute(
        builder: (context) => EditTaskScreen(),
        settings: RouteSettings(name: RouteNames.editScreen),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => MainScreen(),
        settings: RouteSettings(name: RouteNames.mainScreen),
      );
  }
}
