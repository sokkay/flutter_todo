import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    Key key,
    this.controller,
    this.labelText,
    this.obscureText = false,
    this.margin,
    this.onChanged,
    this.errorText,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final EdgeInsets margin;
  final ValueChanged<String> onChanged;
  final String errorText;
  final TextInputType keyboardType;

  InputDecoration get inputDecoration => InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        errorText: errorText,
        alignLabelWithHint: true,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(12),
      //   color: Colors.white,
      // ),
      child: TextField(
        key: key,
        controller: controller,
        decoration: inputDecoration.copyWith(labelText: labelText),
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
      ),
    );
  }
}
