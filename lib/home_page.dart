import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                '${users?.email}',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Log Out')),
            ],
          ),
        ));
  }
}
