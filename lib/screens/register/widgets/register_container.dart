import 'package:TodoApp/repositories/authentication_repository.dart';
import 'package:TodoApp/screens/register/cubit/register_cubit.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/widgets/auth_bottom_text.dart';
import 'package:TodoApp/widgets/custom_text_input.dart';
import 'package:TodoApp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
      padding: CustomTheme.horizontalPadding,
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: BlocProvider(
              create: (context) =>
                  RegisterCubit(context.read<AuthenticationRepository>()),
              child: _RegisterForm(),
            ),
          ),
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
  final margin = const EdgeInsets.only(bottom: 20);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomTextInput(
                key: const Key('registerForm_nameInput_textField'),
                labelText: 'Nombre',
                margin: margin,
                onChanged: (name) =>
                    context.read<RegisterCubit>().nameChanged(name.trim()),
                errorText: state.name.invalid ? 'Nombre no válido' : null,
              );
            },
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomTextInput(
                key: const Key('registerForm_emailInput_textField'),
                margin: margin,
                labelText: 'Email',
                onChanged: (email) =>
                    context.read<RegisterCubit>().emailChanged(email.trim()),
                errorText: state.email.invalid ? 'Email no válido' : null,
              );
            },
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomTextInput(
                key: const Key('registerForm_passwordInput_textField'),
                margin: margin,
                labelText: 'Contraseña',
                obscureText: true,
                onChanged: (password) =>
                    context.read<RegisterCubit>().passwordChanged(password),
                errorText: state.password.invalid
                    ? 'Password no válido. \nAl menos 6 caracteres.\nIncluya letras y números.'
                    : null,
              );
            },
          ),
          SizedBox(height: 12),
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: listener,
            builder: (context, state) {
              return MaterialButton(
                onPressed: state.status.isSubmissionInProgress
                    ? null
                    : () =>
                        context.read<RegisterCubit>().signUpWithCredentials(),
                child: Text('Crear Cuenta'),
                color: CustomTheme.color1,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minWidth: double.maxFinite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void listener(BuildContext context, RegisterState state) {
    switch (state.status) {
      case FormzStatus.submissionInProgress:
        showCustomLoadingDialog(context);
        break;
      case FormzStatus.submissionFailure:
        showDialogError(context, state.errorMessage);
        break;
      default:
        break;
    }
  }
}
