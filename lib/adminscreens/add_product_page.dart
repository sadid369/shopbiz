import 'package:flutter/material.dart';
import 'package:shopbiz/models/category.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/widgets/app_drawer.dart';

class AddProductPage extends StatefulWidget {
  static const id = "/addproduct";
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController categoryC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Add Product",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                Container(
                  decoration: decoration(),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    value: categories[0].name,
                    onChanged: (value) {
                      categoryC.text = value.toString();
                      print(categoryC.text);
                    },
                    items: categories
                        .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(e.name),
                            )))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
