// ignore_for_file: avoid_print

import 'package:coffee/services/auth_service.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService authService = AuthService();

  //control over the email,password textFiled,
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sing Up to Coffee App'),
        centerTitle: false,
        leading: const Icon(Icons.coffee),
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
                //signinWithEmailAndPassword();
                print(emailController.text);
                print(passwordController.text);
                widget.toggleView;
              },
              child: const Text('Register '),
            ),
          ],
        ),
      ),
    );
  }
}
