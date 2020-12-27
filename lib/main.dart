import 'package:TodoApp/blocs/auth/auth_bloc.dart';
import 'package:TodoApp/blocs/category/category_bloc.dart';
import 'package:TodoApp/blocs/simple_bloc_observer.dart';
import 'package:TodoApp/repositories/authentication_repository.dart';
import 'package:TodoApp/routes/routes.dart';
import 'package:TodoApp/routes/routes_names.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryBloc()),
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthenticationRepository>(),
            ),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes,
      initialRoute: RouteNames.splashScreen,
      theme: CustomTheme().theme(),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => current.status != previous.status,
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                _navigator.pushNamedAndRemoveUntil(
                  RouteNames.mainScreen,
                  (route) => false,
                );
                break;
              case AuthStatus.unauthenticated:
                _navigator.pushNamedAndRemoveUntil(
                  RouteNames.loginScreen,
                  (route) => false,
                );
                break;
              case AuthStatus.error:
              // TODO: mostrar dialogo del error
              case AuthStatus.unknown:
              default:
                break;
            }
          },
          child: child,
        );
      },
    );
  }
}
