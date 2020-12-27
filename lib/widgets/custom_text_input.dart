import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    Key key,
    @required this.controller,
    this.labelText,
    this.obscureText = false,
    this.margin,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final EdgeInsets margin;

  final inputDecoration = InputDecoration(
    fillColor: Colors.transparent,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        decoration: inputDecoration.copyWith(labelText: labelText),
        obscureText: obscureText,
      ),
    );
  }
}
