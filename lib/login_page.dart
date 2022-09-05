import 'package:flutter/material.dart';
import 'package:shopbiz/auth_provider.dart';
import 'package:shopbiz/custom_color.dart';

class LoginPage extends StatelessWidget {
  static const id = "/loginoage";
  LoginPage({Key? key}) : super(key: key);
  GlobalKey fromKey = GlobalKey<FormState>();
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              height: 200,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "SHOPBIZ",
              style: TextStyle(fontSize: 30, fontFamily: "roboto-bold"),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: inputController,
                          decoration: const InputDecoration(
                            hintText: "Enter Phone Number",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      color: primarycolor,
                      onPressed: () {
                        if (inputController.text != null) {
                          final phone = '+88' + inputController.text;
                          AuthProvider().loginWithPhone(context, phone);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
