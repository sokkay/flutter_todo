import 'package:flutter/material.dart';

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
}
