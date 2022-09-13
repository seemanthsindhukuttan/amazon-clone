import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../product_detial/product_detial_screen.dart';
import 'product_show_card.dart';
import 'product_showcase_List_view.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();

    return GetX<HomeScreenController>(
      builder: (_) {
        return controller.productdata.isEmpty
            ? SizedBox(
                height: AppConstants.screenSize.height / 3,
                child: Center(
                  child: AppUtils.appCircularProgressIndicator,
                ),
              )
            : Column(
                children: [
                  // upto 0% off list
                  controller.upto0.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 0% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto0.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto0[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                        productModel: productModel),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 10% off list
                  controller.upto10.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 10% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto10.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto10[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 20% off list
                  controller.upto20.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 20% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto20.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto20[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 30% off list
                  controller.upto30.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 30% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto30.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto30[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 40% off list
                  controller.upto40.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 40% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto40.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto40[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 50% off list
                  controller.upto50.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 50% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto50.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto50[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                  // upto 60% off list
                  controller.upto60.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 60% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto60.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto60[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 70% off list
                  controller.upto70.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 70% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto70.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto70[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 80% off list
                  controller.upto80.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 80% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto80.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto80[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                  // upto 90% off list
                  controller.upto90.isEmpty
                      ? const SizedBox()
                      : ProductShowCaseListView(
                          title: 'Upto 90% Off',
                          listView: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.upto90.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel = controller.upto90[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      productModel: productModel,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ],
              );
      },
    );
  }
}
