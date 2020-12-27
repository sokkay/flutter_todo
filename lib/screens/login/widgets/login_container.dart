import 'package:TodoApp/blocs/auth/auth_bloc.dart';
import 'package:TodoApp/widgets/auth_bottom_text.dart';
import 'package:flutter/material.dart';

import 'package:TodoApp/routes/routes_names.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/widgets/custom_text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginContainer extends StatelessWidget {
  final titleTextStyle = TextStyle(fontSize: 28);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomTheme.horizontalPadding,
      decoration: BoxDecoration(
        color: CustomTheme.loginContainerColor,
        borderRadius: CustomTheme.authBorder,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text('Iniciar Sesión', style: titleTextStyle),
            ),
          ),
          Expanded(flex: 8, child: _LoginForm()),
          Expanded(
            flex: 1,
            child: AuthBottomText(
              text: '¿No tienes cuenta? ',
              buttonText: 'Registrate!',
              onPress: () =>
                  Navigator.of(context).pushNamed(RouteNames.registerScreen),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  _LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  TextEditingController _emailCtrl;
  TextEditingController _passwordCtrl;

  final InputDecoration inputDecoration = new InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide.none,
    ),
  );

  @override
  void initState() {
    _emailCtrl = new TextEditingController();
    _passwordCtrl = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        CustomTextInput(
          controller: _emailCtrl,
          labelText: 'Email',
        ),
        CustomTextInput(
          controller: _passwordCtrl,
          labelText: 'Contraseña',
          obscureText: true,
          margin: const EdgeInsets.only(top: 16, bottom: 26),
        ),
        MaterialButton(
          onPressed: () {},
          child: Text('Iniciar sesión'),
          color: CustomTheme.color1,
          padding: const EdgeInsets.symmetric(vertical: 14),
          minWidth: double.maxFinite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('O también'),
        ),
        Row(
          children: [
            Material(
              type: MaterialType.circle,
              elevation: 1,
              color: Colors.white,
              child: IconButton(
                icon: SvgPicture.asset('assets/google.svg'),
                onPressed: () {
                  context.read<AuthBloc>().add(AuthSignInWithGoogle());
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }
}
