// ignore_for_file: avoid_print
import 'package:coffee/services/auth_service.dart';
import 'package:coffee/ui/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// to combine flutter with fireBase, need to use some library to make this app,
// 1. firebase_auth, cloude_fireStore.

/*
  General Structure of this application, 
  MyApp -> Wrapper -----------------------------> Home -> CoffeeDetails
                   |                                   |-> Settings .
                   | -> Authenticate --> SingIn
                                     |-> Register

  . MyApp -> Wrapper -> {Home, Authenticate} apply the factory method pattern.
  . in case of accessing on the Home, need to apply the { Mvp } architecture pattern.

        Firebase App Id
  android   1:677761339579:android:de33330c688f38658cd99e
  ios       1:677761339579:ios:4a80f85d017eaf0d8cd99e

*/

void main() async {
  //initialize firebase.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  //the first state callback method for the statfulWidget ,
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //srround this Wrapper with streams, to know when user state has change...

    return StreamProvider<User?>.value(
      initialData: null, //assume user is not login yet, so user is null
      value: AuthService().userState,
      child: const Scaffold(
        body: Wrapper(),
      ),
    );
  }
}



//can using NotifierValue instead of create a full custome object in case of
//  just using only single value.
