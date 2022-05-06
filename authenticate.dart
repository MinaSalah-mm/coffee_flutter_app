import 'package:coffee/ui/authe/register.dart';
import 'package:coffee/ui/authe/sign_in.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // variable to navigate between signin and register without routting.
  bool showSignIn = true;

  void toggleBetweenViews() {
    setState(() {
      showSignIn = !showSignIn; //toggle from true -> false and vice versa.
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Center(
        child: SingIn(toggleView: toggleBetweenViews),
      );
    } else {
      return Center(
        child: Register(toggleView: toggleBetweenViews),
      );
    }
  }
}
