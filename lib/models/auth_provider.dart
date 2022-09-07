import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopbiz/home_page.dart';
import 'package:shopbiz/screens/main_screen.dart';

class AuthProvider {
  Future<bool> loginWithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpC = TextEditingController();
    _auth.verifyPhoneNumber(
      verificationCompleted: (AuthCredential credential) async {
        UserCredential result = await _auth.signInWithCredential(credential);
        Navigator.pop(context);
        User user = result.user!;
        if (user != null) {
          Navigator.pushReplacementNamed(context, MainPage.id);
        } else {
          Fluttertoast.showToast(msg: "User is not sign in");
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: e.toString());
      },
      codeSent: (String verificationCode, int? token) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Enter OTP'),
                content: Column(
                  children: [
                    TextField(
                      controller: otpC,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      final code = otpC.text;
                      AuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: verificationCode, smsCode: code);
                      UserCredential result =
                          await _auth.signInWithCredential(credential);
                      User user = result.user!;
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, MainPage.id);
                        print("success");
                      } else {
                        Fluttertoast.showToast(msg: "Error");
                      }
                    },
                    child: const Text(
                      "Verify",
                    ),
                  ),
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (id) => {},
      phoneNumber: phone,
    );
    return true;
  }
}
