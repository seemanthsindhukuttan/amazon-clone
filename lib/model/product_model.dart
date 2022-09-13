import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String uid;
  final String productName;
  final String imageUrl;
  final double price;
  final double discountPrice;
  final int discount;
  final String sellerName;
  final String sellerUid;
  final double rating;
  final int ratingCount;
  int itemCount;

  ProductModel({
    required this.uid,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.ratingCount,
    required this.itemCount,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "productName": productName,
      "imageUrl": imageUrl,
      "price": price,
      "discount": discount,
      "sellerName": sellerName,
      'discountPrice': discountPrice,
      "sellerUid": sellerUid,
      "rating": rating,
      "ratingCount": ratingCount,
      "itemCount": itemCount,
    };
  }

  factory ProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ProductModel(
      uid: json['uid'],
      productName: json["productName"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      discountPrice: json['discountPrice'],
      discount: json["discount"],
      sellerName: json["sellerName"],
      sellerUid: json["sellerUid"],
      rating: json["rating"],
      ratingCount: json["ratingCount"],
      itemCount: json["itemCount"],
    );
  }
}
