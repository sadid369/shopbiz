import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/utils/text_style.dart';

class ProductPage extends StatelessWidget {
  static const id = "/productPage";
  FirebaseFirestore db = FirebaseFirestore.instance;
  ProductPage({Key? key}) : super(key: key);

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
                ? ListView.builder(
                    itemCount: values.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: decoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(values[index]['brandName']),
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
