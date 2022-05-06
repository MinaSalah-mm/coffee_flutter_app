// ignore_for_file: avoid_print

import 'dart:io';
import 'package:coffee/services/auth_service.dart';
import 'package:coffee/ui/authe/authenticate.dart';
import 'package:coffee/ui/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// new

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //register for the coming stream form the main, about either user login/logout
    final user = Provider.of<User?>(context);

    print('Wrapper_widget -> build() -> called <---------------->');

    // return either Home or Authenticate widget.
    if (user == null) {
      return const Authenticate(); // not login
    } else {
      return const Home(); // Already login before.
    }
  }
}
