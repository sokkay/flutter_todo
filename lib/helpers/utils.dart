import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  /// Funcion que ayuda a eliminar el focus de los campos de texto
  static void lostFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static String formateDateCapitalizate(DateTime date,
      [String newPattern = 'EEEE, d MMMM']) {
    final dateFormated = DateFormat(newPattern, 'es').format(date);
    final dateCapitalized = dateFormated.split(' ').map((e) {
      return e.replaceRange(0, 1, e[0].toUpperCase());
    }).join(' ');
    return dateCapitalized;
  }
}
