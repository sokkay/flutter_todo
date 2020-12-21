import 'package:TodoApp/routes/routes.dart';
import 'package:TodoApp/routes/routes_names.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes,
      initialRoute: RouteNames.mainScreen,
      theme: CustomTheme().theme(),
    );
  }
}
