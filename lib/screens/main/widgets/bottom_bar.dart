import 'package:TodoApp/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final buttonTextStyle = TextStyle(
    color: CustomTheme.textColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () => {},
              color: Colors.grey[100],
              shape: StadiumBorder(),
              padding: EdgeInsets.only(left: 18, top: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    'Agregar Nueva Tarea',
                    style: buttonTextStyle,
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Material(
            color: Colors.transparent,
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: Ink(
              decoration: const ShapeDecoration(
                color: CustomTheme.color1,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.list),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
