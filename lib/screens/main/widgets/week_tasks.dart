import 'package:TodoApp/screens/main/widgets/task_list_card.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class WeekTasks extends StatelessWidget {
  WeekTasks({
    Key key,
  }) : super(key: key);

  final todayTasks = [
    {
      'complete': true,
      'title': 'Comprar nuevas copas',
      'color': Colors.teal.value,
    },
    {
      'complete': false,
      'title': 'Comprar frutas',
      'color': Colors.teal.value,
    },
    {
      'complete': false,
      'title': 'Llamar a Claudia por su cumpleaños',
      'color': Colors.purple.value,
    },
    {
      'complete': false,
      'title': 'Desarrollar prototipo',
      'color': Colors.red.value,
    },
    {
      'complete': false,
      'title': 'Desarrollar prototipo',
      'color': Colors.red.value,
    },
    {
      'complete': false,
      'title': 'Desarrollar prototipo',
      'color': Colors.red.value,
    },
    {
      'complete': false,
      'title': 'Desarrollar prototipo',
      'color': Colors.red.value,
    },
  ];

  final textStyle = CustomTheme.textLabelMainStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomTheme.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tareas de Hoy', style: textStyle),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: todayTasks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => TaskListCard(
                color: Color(todayTasks[index]['color']),
                complete: todayTasks[index]['complete'],
                title: todayTasks[index]['title'],
              ),
            ),
          )
        ],
      ),
    );
  }
}
