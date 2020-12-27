part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChange extends AuthEvent {
  final User user;
  const AuthUserChange(this.user);

  @override
  List<Object> get props => [user];
}

class AuthLogoutRequested extends AuthEvent {}
