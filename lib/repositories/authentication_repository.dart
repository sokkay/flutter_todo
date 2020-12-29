import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import 'package:TodoApp/models/user.dart';

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthenticationRepository({
    firebase_auth.FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  Future<void> logInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final firebase_auth.GoogleAuthCredential credential =
          firebase_auth.GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await _firebaseAuth.signInWithCredential(credential);
    } on Exception catch (e) {
      print(e);
      throw LogInWithGoogleFailure();
    }
  }

  Future<void> logInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No se encuentra usuario para ese email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Contraseña errónea.';
      }
      throw LogInWithEmailAndPasswordFailure(errorMessage);
    } on Exception catch (e) {
      print(e);
      throw LogInWithEmailAndPasswordFailure('Error Inesperado');
    }
  }

  Future<void> signUp(
      {@required String email,
      @required String password,
      @required String name}) async {
    assert(email != null && password != null);
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user.updateProfile(displayName: name);
    } on firebase_auth.FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'Contraseña demasiado debíl.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Email ya esta en uso.';
      }
      throw SignUpFailure(errorMessage);
    } on Exception {
      throw SignUpFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

class TodoException implements Exception {
  final String message;

  TodoException(this.message);

  @override
  String toString() => 'Error Message: $message';
}

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure extends TodoException {
  SignUpFailure([String message]) : super(message);
}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure extends TodoException {
  LogInWithEmailAndPasswordFailure([String message]) : super(message);
}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure extends TodoException {
  LogInWithGoogleFailure([String message]) : super(message);
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure extends TodoException {
  LogOutFailure([String message]) : super(message);
}
