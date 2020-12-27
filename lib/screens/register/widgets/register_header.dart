import 'dart:io';

import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(
              Platform.isIOS || Platform.isMacOS
                  ? Icons.arrow_back_ios
                  : Icons.arrow_back,
            ),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Registro',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
