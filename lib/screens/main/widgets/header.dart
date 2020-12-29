import 'package:TodoApp/blocs/auth/auth_bloc.dart';
import 'package:TodoApp/helpers/utils.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  final dateFormated = Utils.formateDateCapitalizate(DateTime.now());

  final nameStyle = new TextStyle(
    color: CustomTheme.textColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  final dateStyle = new TextStyle(
    color: CustomTheme.textColor,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomTheme.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Text(
                'Hola ${state.user != null ? state.user?.name?.split(' ')?.first : "Usuario"}!',
                style: nameStyle,
              );
            },
          ),
          Text(
            dateFormated,
            style: dateStyle,
          ),
        ],
      ),
    );
  }
}
