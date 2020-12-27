part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSignInWithGoogle extends AuthEvent {}

class AuthSignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  AuthSignInWithEmailAndPassword({
    @required this.email,
    @required this.password,
  });
}

class AuthRegisterWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterWithEmailAndPassword({
    @required this.email,
    @required this.password,
  });
}

class AuthSignOut extends AuthEvent {}

class AuthUserChange extends AuthEvent {
  final User user;
  AuthUserChange(this.user);
}
