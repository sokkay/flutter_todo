import 'package:TodoApp/repositories/authentication_repository.dart';
import 'package:TodoApp/screens/login/cubit/login_cubit.dart';
import 'package:TodoApp/widgets/auth_bottom_text.dart';
import 'package:TodoApp/widgets/dialogs.dart';
import 'package:flutter/material.dart';

import 'package:TodoApp/routes/routes_names.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/widgets/custom_text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

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
          Expanded(
            flex: 8,
            child: BlocProvider(
              create: (_) =>
                  LoginCubit(context.read<AuthenticationRepository>()),
              child: _LoginForm(),
            ),
          ),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        switch (state.status) {
          case FormzStatus.submissionInProgress:
            showCustomLoadingDialog(context);
            break;
          case FormzStatus.submissionFailure:
            Navigator.pop(context);
            showDialogError(
                context, state.errorMessage ?? 'Error inesperado...');
            break;
          default:
            break;
        }
      },
      child: Column(
        children: [
          SizedBox(height: 12),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextInput(
                key: const Key('loginForm_emailInput_textField'),
                labelText: 'Email',
                errorText: state.email.invalid ? 'Email no válido' : null,
                onChanged: (email) =>
                    context.read<LoginCubit>().emailChanged(email),
                keyboardType: TextInputType.emailAddress,
              );
            },
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextInput(
                key: const Key('loginForm_passwordInput_textField'),
                labelText: 'Contraseña',
                obscureText: true,
                margin: const EdgeInsets.only(top: 16, bottom: 26),
                onChanged: (password) =>
                    context.read<LoginCubit>().passwordChanged(password),
              );
            },
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return MaterialButton(
                onPressed: state.status.isSubmissionInProgress
                    ? null
                    : () => context.read<LoginCubit>().logInWithCredentials(),
                child: Text('Iniciar sesión'),
                color: CustomTheme.color1,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minWidth: double.maxFinite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('O también'),
          ),
          Row(
            children: [
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Material(
                    type: MaterialType.circle,
                    elevation: 1,
                    color: Colors.white,
                    child: IconButton(
                      icon: SvgPicture.asset('assets/google.svg'),
                      onPressed: state.status.isSubmissionInProgress
                          ? null
                          : () => context.read<LoginCubit>().logInWithGoogle(),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
