import 'package:flutter/material.dart';

class AuthBottomText extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPress;
  const AuthBottomText({
    Key key,
    @required this.text,
    @required this.buttonText,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          InkWell(
            onTap: onPress,
            child: Text(
              buttonText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
