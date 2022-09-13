import '../../core/utils.dart';
import '../../services/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../core/constants.dart';
import '../../model/product_model.dart';
import 'widget/cart_tile.dart';
import '../home/widgets/location_bar_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../product_detial/product_detial_screen.dart';
import '../../widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ScrollController _scrollController;
  final ValueNotifier<double> _offset = ValueNotifier(0);
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _offset.value = _scrollController.position.pixels;
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.whiteBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(
          isReadOnly: true,
          autofocus: false,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: AppConstants.screenSize.height / 20,
                  width: AppConstants.screenSize.width,
                ),
                GradientElevatedButton(
                  width: AppConstants.screenSize.width / 2,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  onPressed: () async {
                    await AppService().buyAllItemInCart();
                    AppUtils.snackBar(
                      title: 'Amazon',
                      content: "Product add to order",
                    );
                  },
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("cart")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading......',
                          style: GoogleFonts.aBeeZee(
                            color: UiColors.blackColor,
                          ),
                        );
                      } else if (snapshot.data == null) {
                        return Text(
                          'Procced to by (0) items',
                          style: GoogleFonts.aBeeZee(
                            color: UiColors.blackColor,
                          ),
                        );
                      } else {
                        return Text(
                          'Procced to by (${snapshot.data?.docs.length}) items',
                          style: GoogleFonts.aBeeZee(
                            color: UiColors.blackColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: AppConstants.screenSize.width,
                  height: AppConstants.screenSize.height / 40,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("cart")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return AppUtils.appCircularProgressIndicator;
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: UiColors.backgroundColor,
                          height: 10,
                          thickness: 6,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = ProductModel.fromJson(
                              json: snapshot.data!.docs[index].data());

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  ProductDetialScreen(productModel: product));
                            },
                            child: CartTileWidget(
                              productName: product.productName,
                              price: product.price.toString(),
                              buyerName: product.sellerName,
                              imageUrl: product.imageUrl,
                              deletebutton: () async {
                                await AppService()
                                    .deleteProductFromCart(uid: product.uid);
                              },
                              saveForLaterbutton: () async {},
                              productIncrementButton: () async {
                                await AppService().updateToCart(
                                  productModel: ProductModel(
                                    uid: product.uid,
                                    productName: product.productName,
                                    imageUrl: product.imageUrl,
                                    price: product.price,
                                    discount: product.discount,
                                    discountPrice: product.discountPrice,
                                    sellerName: product.sellerName,
                                    sellerUid: product.sellerUid,
                                    ratingCount: product.ratingCount,
                                    itemCount: product.itemCount + 1,
                                    rating: product.rating,
                                  ),
                                );
                              },
                              productdecrementButton: () async {
                                if (product.itemCount > 1) {
                                  await AppService().updateToCart(
                                    productModel: ProductModel(
                                      uid: product.uid,
                                      productName: product.productName,
                                      imageUrl: product.imageUrl,
                                      price: product.price,
                                      discount: product.discount,
                                      discountPrice: product.discountPrice,
                                      sellerName: product.sellerName,
                                      sellerUid: product.sellerUid,
                                      ratingCount: product.ratingCount,
                                      itemCount: product.itemCount - 1,
                                      rating: product.rating,
                                    ),
                                  );
                                }
                              },
                              seenMoreLikeThisButton: () {},
                              count: product.itemCount.toString(),
                            ),
                          );
                        },
                      );
                    }
                  },
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _offset,
              builder: (BuildContext context, double value, Widget? _) {
                return LocationBarWidget(offset: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
