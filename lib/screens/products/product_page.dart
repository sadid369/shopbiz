import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopbiz/utils/custom_color.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/utils/text_style.dart';

class ProductPage extends StatefulWidget {
  static const id = "/productPage";

  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isFavorite = false;
  List favorites = [];
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var category = data["category"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(category),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: db
              .collection('products')
              .where("category", isEqualTo: category)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              Fluttertoast.showToast(msg: "Some missing");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            final values = snapshot.data!.docs;

            return values.length > 0
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: values.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: decoration(),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  values[index]['imagesUrl'][0],
                                  fit: BoxFit.cover,
                                  height: 400,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              // isFavorite = !isFavorite;
                                              if (favorites.contains(
                                                  values[index]
                                                      ['productName'])) {
                                                favorites.remove(values[index]
                                                    ['productName']);
                                                print(favorites);
                                                isFavorite = false;
                                              } else {
                                                favorites.add(values[index]
                                                    ['productName']);
                                                print(favorites);
                                                isFavorite = true;
                                              }
                                            });
                                          },
                                          icon: isFavorite
                                              ? const Icon(
                                                  FontAwesomeIcons.heart,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.solidHeart,
                                                  color: Colors.white,
                                                ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          values[index]['productName'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            FontAwesomeIcons.cartPlus,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "No Product Found",
                      style: heading2,
                    ),
                  );
          }),
    );
  }
}
