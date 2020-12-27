import 'dart:async';

import 'package:TodoApp/models/status.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    _authStateSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((user) => this.add(AuthUserChange(user)));
  }

  StreamSubscription<User> _authStateSubscription;
  GoogleSignIn _googleSignIn = GoogleSignIn.standard();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthSignInWithGoogle) {
      yield* mapSigInWithGoogleToState();
    }
    if (event is AuthSignOut) {
      yield* mapSignOutToState();
    }
    if (event is AuthSignInWithEmailAndPassword) {
      yield* mapSignInWithEmailAndPasswordToState(event);
    }
    if (event is AuthRegisterWithEmailAndPassword) {
      yield* mapRegisterWithEmailAndPasswordToState(event);
    }
    if (event is AuthUserChange) {
      yield* mapUserChangeToState(event);
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }

  Stream<AuthState> mapSigInWithGoogleToState() async* {
    yield state.copyWith(status: Status.loading);
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      yield state.copyWith(
        status: Status.complete,
      );
    } catch (e) {
      print(e);
      yield state.copyWith(
        status: Status.complete,
        errorMessage: 'Error inesperado.',
      );
    }
  }

  Stream<AuthState> mapSignInWithEmailAndPasswordToState(
      AuthSignInWithEmailAndPassword event) async* {
    yield state.copyWith(status: Status.loading);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      yield state.copyWith(
        status: Status.complete,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No se encuentra usuario para ese email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Contraseña errónea.';
      }
      yield state.copyWith(
        status: Status.error,
        errorMessage: errorMessage,
      );
    } catch (e) {
      print(e);
      yield state.copyWith(
        status: Status.error,
        errorMessage: 'Error inesperado.',
      );
    }
  }

  Stream<AuthState> mapRegisterWithEmailAndPasswordToState(
      AuthRegisterWithEmailAndPassword event) async* {
    yield state.copyWith(status: Status.loading);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      yield state.copyWith(
        user: userCredential.user,
        status: Status.complete,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'Contraseña demasiado debíl.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Email ya esta en uso.';
      }
      yield state.copyWith(
        status: Status.error,
        errorMessage: errorMessage,
      );
    } catch (e) {
      print(e);
      yield state.copyWith(
        status: Status.error,
        errorMessage: 'Error inesperado.',
      );
    }
  }

  Stream<AuthState> mapSignOutToState() async* {
    yield state.copyWith(status: Status.loading);

    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      yield state.copyWith(
        user: null,
        status: Status.complete,
      );
    } catch (e) {
      print(e);
      yield state.copyWith(
        status: Status.error,
        errorMessage: 'Error inesperado.',
      );
    }
  }

  Stream<AuthState> mapUserChangeToState(AuthUserChange event) async* {
    if (event.user != null) {
      yield state.copyWith(user: event.user, authStatus: AuthStatus.logged);
    } else {
      yield state.copyWith(authStatus: AuthStatus.loggedOut);
    }
  }
}
