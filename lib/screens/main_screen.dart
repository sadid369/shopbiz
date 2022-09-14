import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopbiz/models/category.dart';
import 'package:shopbiz/screens/products/product_page.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/widgets/app_drawer.dart';
import 'package:shopbiz/widgets/slider.dart';

import '../utils/constant.dart';

class MainPage extends StatefulWidget {
  static const id = "/MainPage";
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchC = TextEditingController();
  List<Category> newList = List.from(categories);
  @override
  void dispose() {
    super.dispose();
    searchC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              decoration: decoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchC.text = value;
                      newList = categories
                          .where((e) => e.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      print(searchC.text);
                    });
                  },
                  controller: searchC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Search Category...",
                      suffixIcon: Icon(FontAwesomeIcons.search)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CSlider(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "CATEGORIES",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: newList
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProductPage.id, arguments: {
                              "category": e.name,
                              "icon": e.icon,
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.purple,
                                  Colors.blue,
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      e.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    e.icon,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
