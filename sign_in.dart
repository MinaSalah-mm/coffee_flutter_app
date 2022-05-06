// ignore_for_file: avoid_print

import 'package:coffee/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  final Function toggleView;

  const SingIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  AuthService authService = AuthService();

  //control over the email,password textFiled,
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sing in with fireBase,
  void singInAnony() async {
    var user = await authService.signInAnonymous(); // user -> is of type user,
    if (user == null) {
      print('SignIn_Widget -> user is null');
    } else {
      print('SignIn_Widget -> user is not null');
      print(user.uid);
    }
  }

  void signinWithEmailAndPassword() async {
    User? user = await authService.singInWithEmailPassword(
        emailController.text, passwordController.text);
    if (user == null) {
      print('SingIn_Widget -> user is null');
    } else {
      print('SingIn_Widget -> user is not null');
      print(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sing In to Coffee App'),
        centerTitle: false,
        leading: const Icon(Icons.coffee),
        actions: <Widget>[
          TextButton.icon(
            // press to navigate to register screen.
            onPressed: () {
              widget.toggleView;
            },
            icon: const Icon(Icons.app_registration_rounded),
            label: const Text(
              'sign up',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "email",
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "password",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                signinWithEmailAndPassword();
              },
              child: const Text('sign in '),
            ),
          ],
        ),
      ),
    );
  }
}
