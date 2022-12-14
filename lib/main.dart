import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopbiz/adminscreens/add_product_page.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/screens/products/product_page.dart';
import 'package:shopbiz/utils/custom_color.dart';
import 'package:shopbiz/home_page.dart';
import 'package:shopbiz/login_page.dart';
import 'package:shopbiz/splashpahe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shopbiz',
      theme: ThemeData(
        primaryColor: primarycolor,
        fontFamily: "roboto-regular",
      ),
      home: MainPage(),
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        LoginPage.id: (context) => LoginPage(),
        ProfileInitPage.id: (context) => ProfileInitPage(),
        MainPage.id: (context) => MainPage(),
        AddProductPage.id: (context) => const AddProductPage(),
        ProductPage.id: (context) => ProductPage(),
      },
    );
  }
}
