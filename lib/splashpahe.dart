import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/home_page.dart';
import 'package:shopbiz/login_page.dart';

class SplashInitPage extends StatelessWidget {
  const SplashInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return LoginPage();
          } else if (snapshot.data!.phoneNumber != null) {}
          return SplashPage();
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  static const id = "/SplashPage";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("images/logo.png"),
          )),
          const Text(
            "SHOPBIZ",
            style: TextStyle(fontSize: 30, fontFamily: "roboto-bold"),
          ),
          const Expanded(child: Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
