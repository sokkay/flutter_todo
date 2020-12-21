import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/screens/main/widgets/category_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final categories = [
    {
      'category': 'Personal',
      'tasks': new List(15),
      'color': Colors.purple.value
    },
    {
      'category': 'Lista de Compras',
      'tasks': new List(12),
      'color': Colors.teal.value
    },
    {'category': 'Trabajo', 'tasks': new List(7), 'color': Colors.red.value},
  ];
  final textStyle = CustomTheme.textLabelMainStyle;

  final padding = const EdgeInsets.only(left: 18);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text('Categorias', style: textStyle),
        ),
        Expanded(
          child: ListView.builder(
            padding: padding,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) => MainScreenCategoryCard(
              title: categories[index]['category'],
              tasks: (categories[index]['tasks'] as List).length,
              color: Color((categories[index]['color'] as int)),
            ),
          ),
        )
      ],
    );
  }
}
