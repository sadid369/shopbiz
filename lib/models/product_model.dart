import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? category;
  String? productName;
  String? serialCode;
  int? price;
  double? weight;
  String? brandName;
  int? quantity;
  List<String>? imagesUrl;
  bool? isOnSale;
  bool? isPopular;
  ProductModel({
    this.category,
    this.productName,
    this.serialCode,
    this.price,
    this.weight,
    this.brandName,
    this.quantity,
    this.imagesUrl,
    this.isOnSale,
    this.isPopular,
  });

  CollectionReference db = FirebaseFirestore.instance.collection('products');
  Future<void> addProduct(ProductModel productModel) async {
    Map<String, dynamic> data = {
      'category': productModel.category,
      'productName': productModel.productName,
      'serialCode': productModel.serialCode,
      'price': productModel.price,
      'weight': productModel.weight,
      'brandName': productModel.brandName,
      'quantity': productModel.quantity,
      'imagesUrl': productModel.imagesUrl,
      'isOnSale': productModel.isOnSale,
      'isPopular': productModel.isPopular,
    };
    await db.add(data);
  }

  Future<void> updateProduct(String id, ProductModel updateProduct) async {
    Map<String, dynamic> data = {
      'category': updateProduct.category,
      'productName': updateProduct.productName,
      'serialCode': updateProduct.serialCode,
      'price': updateProduct.price,
      'weight': updateProduct.weight,
      'brandName': updateProduct.brandName,
      'quantity': updateProduct.quantity,
      'imagesUrl': updateProduct.imagesUrl,
      'isOnSale': updateProduct.isOnSale,
      'isPopular': updateProduct.isPopular,
    };
    await db.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    await db.doc(id).delete();
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     'category': category,
  //     'productName': productName,
  //     'serialCode': serialCode,
  //     'price': price,
  //     'weight': weight,
  //     'brandName': brandName,
  //     'quantity': quantity,
  //     'imagesUrl': imagesUrl,
  //     'isOnSale': isOnSale,
  //     'isPopular': isPopular,
  //   };
  // }

//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     return ProductModel(
//       category: map['category'] ?? '',
//       productName: map['productName'] ?? '',
//       serialCode: map['serialCode'] ?? '',
//       price: map['price']?.toInt() ?? 0,
//       weight: map['weight']?.toDouble() ?? 0.0,
//       brandName: map['brandName'] ?? '',
//       quantity: map['quantity']?.toInt() ?? 0,
//       imagesUrl: List<String>.from(map['imagesUrl']),
//       isOnSale: map['isOnSale'] ?? false,
//       isPopular: map['isPopular'] ?? false,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ProductModel.fromJson(String source) =>
//       ProductModel.fromMap(json.decode(source));
// }
}
