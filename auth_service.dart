// ignore_for_file: avoid_print
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//this file will using the firebase_auth package.
// 8:49:9
class AuthService {
  // class service -> use cases :

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user state from the firebase, { register, login, logout }.
  Stream<User?> get userState {
    return _auth.authStateChanges();
  }

  // sign in anyonmous.
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return result.user;
    } on Exception catch (e) {
      print("the error is -> ${e.toString()}");
      return null;
    }
  }

  // sign in with email & password.
  Future singInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on Exception catch (e) {
      print('the error is -> ${e.toString()}');
      return null;
    }
  }

  // register with email & password .

  // sing out .
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
