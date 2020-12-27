import 'dart:async';

import 'package:TodoApp/models/status.dart';
import 'package:TodoApp/models/user.dart';
import 'package:TodoApp/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthenticationRepository authenticationRepository)
      : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthState.unkown()) {
    _authStateSubscription = _authenticationRepository.user
        .listen((user) => this.add(AuthUserChange(user)));
  }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User> _authStateSubscription;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthUserChange) {
      yield mapUserChangeToState(event);
    }
    if (event is AuthLogoutRequested) {
      await _authenticationRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }

  AuthState mapUserChangeToState(AuthUserChange event) =>
      event.user != User.empty
          ? AuthState.authenticated(event.user)
          : const AuthState.unauthenticated();
}
