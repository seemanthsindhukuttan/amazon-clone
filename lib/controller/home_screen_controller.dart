import '../core/constants.dart';
import '../services/get_product_service.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class HomeScreenController extends GetxController {
  RxList<ProductModel> productdata = <ProductModel>[].obs;
  RxList<ProductModel> upto0 = <ProductModel>[].obs;
  RxList<ProductModel> upto10 = <ProductModel>[].obs;
  RxList<ProductModel> upto20 = <ProductModel>[].obs;
  RxList<ProductModel> upto30 = <ProductModel>[].obs;
  RxList<ProductModel> upto40 = <ProductModel>[].obs;
  RxList<ProductModel> upto50 = <ProductModel>[].obs;
  RxList<ProductModel> upto60 = <ProductModel>[].obs;
  RxList<ProductModel> upto70 = <ProductModel>[].obs;
  RxList<ProductModel> upto80 = <ProductModel>[].obs;
  RxList<ProductModel> upto90 = <ProductModel>[].obs;

  Future<void> getData() async {
    productdata.clear();
    upto0.clear();
    upto10.clear();
    upto20.clear();
    upto30.clear();
    upto40.clear();
    upto50.clear();
    upto60.clear();
    upto70.clear();
    upto80.clear();
    upto90.clear();

    productdata.value = await GetProductService().getProduct();

    for (var product in productdata) {
      if (product.discount == AppConstants.discountKey[0]) {
        upto0.add(product);
      } else if (product.discount == AppConstants.discountKey[1]) {
        upto10.add(product);
      } else if (product.discount == AppConstants.discountKey[2]) {
        upto20.add(product);
      } else if (product.discount == AppConstants.discountKey[3]) {
        upto30.add(product);
      } else if (product.discount == AppConstants.discountKey[4]) {
        upto40.add(product);
      } else if (product.discount == AppConstants.discountKey[5]) {
        upto50.add(product);
      } else if (product.discount == AppConstants.discountKey[6]) {
        upto60.add(product);
      } else if (product.discount == AppConstants.discountKey[7]) {
        upto70.add(product);
      } else if (product.discount == AppConstants.discountKey[8]) {
        upto80.add(product);
      } else if (product.discount == AppConstants.discountKey[9]) {
        upto90.add(product);
      } else {
        upto0.add(product);
      }
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
