import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int tasks;
  final Color color;
  final VoidCallback onTap;

  CategoryCard({
    Key key,
    @required this.title,
    @required this.tasks,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  final titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  final taskStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(right: 10, top: 8),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 18,
                top: 16,
                right: 30,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: titleStyle),
                  SizedBox(height: 5),
                  Text('$tasks tareas', style: taskStyle)
                ],
              ),
            ),
            color: color,
          ),
        ),
      ],
    );
  }
}
