import 'dart:async';

import 'package:emplolance/home_page.dart';
import 'package:emplolance/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF17181C),
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage('assets/Logo(beta).png'),
        )),
      ),
      floatingActionButton:
          Image(image: AssetImage('assets/splashLoading.gif')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
