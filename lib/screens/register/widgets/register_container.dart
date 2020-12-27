import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/widgets/auth_bottom_text.dart';
import 'package:TodoApp/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.loginContainerColor,
        borderRadius: CustomTheme.authBorder,
      ),
      child: Container(
        padding: CustomTheme.horizontalPadding,
        child: Column(
          children: [
            Expanded(flex: 9, child: _RegisterForm()),
            Expanded(
              flex: 1,
              child: AuthBottomText(
                text: '¿Ya tienes cuenta? ',
                buttonText: 'Inicia Sesión!',
                onPress: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  TextEditingController nameCtrl;
  TextEditingController emailCtrl;
  TextEditingController passwordCtrl;

  @override
  void initState() {
    nameCtrl = new TextEditingController();
    emailCtrl = new TextEditingController();
    passwordCtrl = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final margin = const EdgeInsets.only(bottom: 20);

    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextInput(
            controller: nameCtrl,
            labelText: 'Nombre',
            margin: margin,
          ),
          CustomTextInput(
            margin: margin,
            labelText: 'Email',
            controller: emailCtrl,
          ),
          CustomTextInput(
            margin: margin,
            labelText: 'Contraseña',
            controller: passwordCtrl,
          ),
          SizedBox(height: 12),
          MaterialButton(
            onPressed: () {},
            child: Text('Crear Cuenta'),
            color: CustomTheme.color1,
            padding: const EdgeInsets.symmetric(vertical: 14),
            minWidth: double.maxFinite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameCtrl?.dispose();
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    super.dispose();
  }
}
