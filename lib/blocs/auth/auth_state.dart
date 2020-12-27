part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final User user;
  final String errorMessage;
  final AuthStatus status;

  const AuthState._({
    this.user = User.empty,
    this.errorMessage,
    this.status = AuthStatus.unknown,
  });

  const AuthState.unkown() : this._();

  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);
  
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  AuthState copyWith({
    User user,
    Status status,
    String errorMessage,
    AuthStatus authStatus,
  }) {
    return AuthState._(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      status: authStatus ?? this.status,
    );
  }

  @override
  List<Object> get props => [user, errorMessage, status];
}
