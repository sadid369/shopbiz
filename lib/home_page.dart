import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/login_page.dart';

class ProfileInitPage extends StatelessWidget {
  static const id = "/ProfileInitPage";
  ProfileInitPage({Key? key}) : super(key: key);
  Future signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(
        () => Navigator.pushReplacementNamed(context, LoginPage.id));
  }

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController houseC = TextEditingController();
  TextEditingController streetC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController provinceC = TextEditingController();
  TextEditingController countryC = TextEditingController();
  final fromkey = GlobalKey<FormState>();
  submit() {
    if (fromkey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Card(
                color: Colors.grey.shade100,
                child: Form(
                  key: fromkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: nameC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Name",
                              labelText: "What People Call You?",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: emailC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Email",
                              labelText: "What is Your Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: houseC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter House no.",
                              labelText: "What House no. ",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: streetC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Street",
                              labelText: "What Street",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: cityC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter City",
                              labelText: "What City",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: provinceC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Province name",
                              labelText: "What Province name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: countryC,
                            validator: (value) {
                              if (value!.length < 5) {
                                return "Should be Geter Than Five ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Country Name",
                              labelText: "What Country Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Icon(
                    Icons.navigate_next,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
