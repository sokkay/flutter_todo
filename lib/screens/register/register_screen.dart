import 'package:TodoApp/helpers/utils.dart';
import 'package:TodoApp/screens/register/widgets/register_container.dart';
import 'package:TodoApp/screens/register/widgets/register_header.dart';
import 'package:TodoApp/widgets/background_circles.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () => Utils.lostFocus(context),
        child: Stack(
          children: [
            //Fondo
            BackgroundCircles(),
            //Body
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RegisterHeader(),
                    ),
                    Expanded(
                      flex: 9,
                      child: RegisterContainer(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
