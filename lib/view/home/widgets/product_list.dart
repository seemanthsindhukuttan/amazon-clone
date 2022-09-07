import 'package:amazon_clone/core/colors.dart';

import 'product_show_card.dart';
import 'product_showcase_List_view.dart';
import '../../product_detial/product_detial_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_screen_controller.dart';
import '../../../core/constants.dart';

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
                child: const Center(
                  child: CircularProgressIndicator(
                    color: UiColors.activeCyanColor,
                  ),
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
                            itemCount: controller.upto0.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto0.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
                                    ),
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
                            itemCount: controller.upto10.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto10.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto20.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto20.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto30.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto30.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto40.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto40.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto50.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto50.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto60.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto60.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto70.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto70.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto80.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto80.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
                            itemCount: controller.upto90.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productModel =
                                  controller.upto90.value[index];
                              return ProductShowCardWidget(
                                image: productModel.imageUrl,
                                productName: productModel.productName,
                                onTap: () {
                                  Get.to(
                                    ProductDetialScreen(
                                      sellerName: productModel.sellerName,
                                      productName: productModel.productName,
                                      price: productModel.price,
                                      imageUrl: productModel.imageUrl,
                                      reviewerName: '',
                                      rating: productModel.rating,
                                      comments: '',
                                      custmorRating: productModel.ratingCount,
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
