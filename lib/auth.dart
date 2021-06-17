import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:clockify/modals/usermodel.dart';
import 'package:minor_project_1/modeluid.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _userFromFirebaseUser(User user) {
    return user != null ? Modal(uid: user.uid).toString() : null;
  }

  Stream<String> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
    //     .map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
