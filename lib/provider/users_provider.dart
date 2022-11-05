import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  User? get user => FirebaseAuth.instance.currentUser;

  AppUser._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      notifyListeners();
      // if (user == null) {
      //   print('User is currently signed out!');
      // } else {
      //   print('User is signed in!');
      // }
    });
  }

  factory AppUser() => AppUser._();

  static AppUser get instance => AppUser();

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signIn({required String email, required String password}) async {
    print('email: $email');
    print('password: $password');

    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(credentials);

      print('sign in successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        throw (e.toString());
      }
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,

    // required String name,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user!.updateDisplayName(name);

      // user!.updateDisplayName(name);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      throw (e.toString());
    }
    return true;
  }

  Future<void> deleteUserProfile() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  Future<void> updateProfileName(String name) {
    return user!.updateDisplayName(name);
  }

  Future<void> resetPassword(String password) {
    return user!.updatePassword(password);
  }
}

// Future<void> updateProfile() async {
//   await ;
// }
