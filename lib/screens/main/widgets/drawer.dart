import 'package:TodoApp/blocs/auth/auth_bloc.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomTheme.color1.withOpacity(0.2),
            ),
            child: DraweHeaderChild(),
          ),
          Divider(),
          ListTile(),
          Spacer(),
          ListTile(
            title: Text('Salir'),
            onTap: () => context.read<AuthBloc>().add(AuthLogoutRequested()),
          )
        ],
      ),
    );
  }
}

class DraweHeaderChild extends StatelessWidget {
  DraweHeaderChild({
    Key key,
  }) : super(key: key);

  final nameTextStyle = TextStyle(fontSize: 20);
  final subtitleTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.user != null) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.maxFinite),
              Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomTheme.color2,
                ),
                child: FadeInImage(
                  placeholder: AssetImage('assets/user.png'),
                  image: NetworkImage(state.user.photo ?? ''),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/user.png'),
                ),
              ),
              SizedBox(height: 12),
              Text(state.user.name, style: nameTextStyle),
              SizedBox(height: 4),
              Text(state.user.email, style: subtitleTextStyle),
            ],
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }
}
