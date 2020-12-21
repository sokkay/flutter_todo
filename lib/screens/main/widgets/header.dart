import 'package:TodoApp/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final dateFormated = DateFormat('EEEE, d MMMM').format(DateTime.now());

  final nameStyle = new TextStyle(
    color: CustomTheme.textColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  final dateStyle = new TextStyle(
    color: CustomTheme.textColor,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomTheme.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Hola Usuario!', style: nameStyle),
          Text(
            dateFormated,
            style: dateStyle,
          ),
        ],
      ),
    );
  }
}
