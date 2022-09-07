import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String uid;
  final String productName;
  final String imageUrl;
  final double price;
  final int discount;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int ratingCount;

  ProductModel({
    required this.uid,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.ratingCount,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "productName": productName,
      "imageUrl": imageUrl,
      "price": price,
      "discount": discount,
      "sellerName": sellerName,
      "sellerUid": sellerUid,
      "rating": rating,
      "ratingCount": ratingCount,
    };
  }

  factory ProductModel.fromJson({
    required DocumentSnapshot<Map<String, dynamic>> json,
  }) {
    return ProductModel(
      uid: json['uid'],
      productName: json["productName"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      discount: json["discount"],
      sellerName: json["sellerName"],
      sellerUid: json["sellerUid"],
      rating: json["rating"],
      ratingCount: json["ratingCount"],
    );
  }
}
