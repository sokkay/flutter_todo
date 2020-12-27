part of 'auth_bloc.dart';

enum AuthStatus { initial, logged, loggedOut, error }

@immutable
class AuthState {
  final User user;
  final Status status;
  final String errorMessage;
  final AuthStatus authStatus;

  AuthState(
      {this.user,
      this.status = Status.initial,
      this.errorMessage,
      this.authStatus = AuthStatus.initial});

  AuthState copyWith({
    User user,
    Status status,
    String errorMessage,
    AuthStatus authStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
