import 'package:TodoApp/screens/edit_taks/edit_task_screen.dart';
import 'package:TodoApp/screens/login/login_screen.dart';
import 'package:TodoApp/screens/register/register_screen.dart';
import 'package:TodoApp/screens/splash/splash_screen.dart';
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
    case RouteNames.loginScreen:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
        settings: RouteSettings(name: RouteNames.loginScreen),
      );
    case RouteNames.registerScreen:
      return MaterialPageRoute(
        builder: (context) => RegisterScreen(),
        settings: RouteSettings(name: RouteNames.registerScreen),
      );
    case RouteNames.splashScreen:
    default:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
        settings: RouteSettings(name: RouteNames.splashScreen),
      );
  }
}
