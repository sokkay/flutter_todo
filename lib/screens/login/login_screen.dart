import 'package:TodoApp/screens/login/widgets/login_container.dart';
import 'package:TodoApp/widgets/background_circles.dart';
import 'package:flutter/material.dart';

import 'package:TodoApp/helpers/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

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
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LoginContainer(),
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
