import 'package:flutter/cupertino.dart';
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
  TextEditingController productNameC = TextEditingController();
  TextEditingController serialCodeC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController weightC = TextEditingController();
  TextEditingController quantityC = TextEditingController();
  TextEditingController onSaleC = TextEditingController();
  TextEditingController popularC = TextEditingController();
  TextEditingController discountC = TextEditingController();
  bool isSale = false;
  bool isPopular = false;
  @override
  void dispose() {
    super.dispose();
    categoryC.dispose();
    productNameC.dispose();
    serialCodeC.dispose();
    priceC.dispose();
    weightC.dispose();
    quantityC.dispose();
    onSaleC.dispose();
    popularC.dispose();
    discountC.dispose();
  }

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
            child: ListView(
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
                ),
                EditField(
                  controller: productNameC,
                  hint: "Enter Product Name",
                  onsubmit: (value) {
                    setState(() {
                      productNameC.text = value;
                    });
                  },
                ),
                EditField(
                  controller: serialCodeC,
                  hint: "Enter Sericel Code",
                  onsubmit: (value) {
                    setState(() {
                      serialCodeC.text = value;
                    });
                  },
                ),
                EditField(
                  controller: priceC,
                  hint: "Enter Price",
                  onsubmit: (value) {
                    setState(() {
                      priceC.text = value;
                    });
                  },
                ),
                EditField(
                  controller: weightC,
                  hint: "Enter Product Weight",
                  onsubmit: (value) {
                    setState(() {
                      weightC.text = value;
                    });
                  },
                ),
                EditField(
                  controller: quantityC,
                  hint: "Enter Product Quantity",
                  onsubmit: (value) {
                    setState(() {
                      quantityC.text = value;
                    });
                  },
                ),
                Container(
                  height: 200,
                  decoration: decoration(),
                  child: const Text("no Image Selected"),
                ),
                SwitchListTile(
                  title: const Text("is this product Popular"),
                  value: isPopular,
                  onChanged: (v) {
                    setState(
                      () {
                        isPopular = v;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: const Text("is this on Sale"),
                  value: isSale,
                  onChanged: (v) {
                    setState(() {
                      isSale = v;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditField extends StatelessWidget {
  String hint;
  Function(String)? onsubmit;
  TextEditingController controller;
  EditField({
    Key? key,
    required this.hint,
    this.onsubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
          decoration: decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: onsubmit,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          )),
    );
  }
}
