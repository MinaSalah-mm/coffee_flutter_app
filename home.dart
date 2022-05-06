import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

//stateLessWidger -> can not be dynamically update the content of the widget.

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void signOut() async {
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () {
              signOut();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('home'),
      ),
    );
  }
}
