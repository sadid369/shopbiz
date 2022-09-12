import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopbiz/models/category.dart';
import 'package:shopbiz/utils/custom_color.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/utils/text_style.dart';
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
  final _key = GlobalKey<FormState>();
  List<XFile>? images = [];
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

  save() {
    bool isValidate = _key.currentState!.validate();
    if (isValidate) {}
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
            key: _key,
            child: ListView(
              children: [
                Container(
                  decoration: decoration(),
                  child: DropdownButtonFormField(
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return "should not be empty";
                      }
                      return null;
                    },
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Select Category"),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    //value: categories[0].name,
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
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return "should not be empty";
                    }
                    return null;
                  },
                  controller: productNameC,
                  hint: "Enter Product Name",
                  onsubmit: (value) {
                    setState(() {
                      productNameC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return "should not be empty";
                    }
                    return null;
                  },
                  controller: serialCodeC,
                  hint: "Enter Sericel Code",
                  onsubmit: (value) {
                    setState(() {
                      serialCodeC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return "should not be empty";
                    }
                    return null;
                  },
                  controller: priceC,
                  hint: "Enter Price",
                  onsubmit: (value) {
                    setState(() {
                      priceC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return "should not be empty";
                    }
                    return null;
                  },
                  controller: weightC,
                  hint: "Enter Product Weight",
                  onsubmit: (value) {
                    setState(() {
                      weightC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return "should not be empty";
                    }
                    return null;
                  },
                  controller: quantityC,
                  hint: "Enter Product Quantity",
                  onsubmit: (value) {
                    setState(() {
                      quantityC.text = value;
                    });
                  },
                ),
                Container(
                  height: 250,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          loadAssets();
                        },
                        child: const Text("Pick Images"),
                      ),
                      Expanded(
                          child: Container(
                        decoration: decoration(),
                        child: buildGridView(),
                      ))
                    ],
                  ),
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
                ),
                MaterialButton(
                  shape: StadiumBorder(),
                  onPressed: () {
                    save();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Upload Product",
                      style: heading1,
                    ),
                  ),
                  color: primarycolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadAssets() async {
    List<XFile>? resultImages;
    String error = "something went wrong";
    try {
      resultImages = await ImagePicker().pickMultiImage();
      if (resultImages != null) {
        setState(() {
          images!.addAll(resultImages!);
        });
      }
    } catch (e) {
      error = e.toString();
      print(error);
    }
  }

  Widget buildGridView() {
    return Container(
      width: double.infinity,
      child: IconButton(
        onPressed: () {},
        icon: images!.length == 0
            ? const Icon(Icons.add)
            : GridView.count(
                crossAxisCount: 3,
                children: List.generate(images!.length, (index) {
                  XFile asset = images![index];
                  return Container(
                      height: 150,
                      width: 150,
                      child: Image.file(
                        File(asset.path),
                        fit: BoxFit.cover,
                      ));
                }),
              ),
      ),
    );
  }
}

class EditField extends StatelessWidget {
  String hint;
  Function(String)? onsubmit;
  String? Function(String?)? validator;
  TextEditingController controller;
  EditField({
    Key? key,
    required this.hint,
    this.onsubmit,
    this.validator,
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
              validator: validator,
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
