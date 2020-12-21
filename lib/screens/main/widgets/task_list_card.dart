import 'package:TodoApp/routes/routes_names.dart';
import 'package:TodoApp/widgets/circular_checkbox.dart';
import 'package:flutter/material.dart';

class TaskListCard extends StatelessWidget {
  final Color color;
  final bool complete;
  final String title;

  const TaskListCard({
    Key key,
    @required this.color,
    @required this.complete,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(12);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: borderRadius,
      ),
      child: ListTile(
        leading: CircularCheckbox(
          color: color,
          check: complete,
          onValueChange: (value) => print(value),
        ),
        onTap: () => handleTap(context),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        title: Text(title),
      ),
    );
  }

  void handleTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      RouteNames.editScreen,
    );
  }
}
