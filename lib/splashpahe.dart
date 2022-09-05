import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopbiz/login_page.dart';

class SplashPage extends StatefulWidget {
  static const id = "/SplashPage";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginPage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
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
