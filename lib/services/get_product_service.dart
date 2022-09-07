import '../model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductService {
  Future<List<ProductModel>> getProduct() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    List<ProductModel> productModel = querySnapshot.docs
        .map((docSnapshot) => ProductModel.fromJson(json: docSnapshot))
        .toList();
    return productModel;
  }
}
