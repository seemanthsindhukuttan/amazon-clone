import '../../core/utils.dart';
import '../../services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/product_model.dart';
import '../../model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../widgets/gradient_button.dart';
import '../home/widgets/location_bar_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../search_result/widgets/rating_star.dart';
import 'widgets/product_review_widget.dart';
import 'widgets/rating_dialog.dart';
import 'package:intl/intl.dart';

class ProductDetialScreen extends StatefulWidget {
  const ProductDetialScreen({Key? key, required this.productModel})
      : super(key: key);

  final ProductModel productModel;

  @override
  State<ProductDetialScreen> createState() => _ProductDetialScreenState();
}

class _ProductDetialScreenState extends State<ProductDetialScreen> {
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

  ValueNotifier<bool> showReview = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.whiteBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(
          isReadOnly: true,
          showBackButton: true,
          autofocus: false,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.screenSize.width * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productModel.sellerName,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: UiColors.activeCyanColor,
                        ),
                      ),
                      RatingStarWidget(
                        rating: widget.productModel.rating,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.screenSize.width * 0.03,
                    vertical: AppConstants.screenSize.height * 0.01,
                  ),
                  child: Text(
                    widget.productModel.productName,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UiColors.blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: UiColors.greyLight,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.network(
                    widget.productModel.imageUrl,
                    height: AppConstants.screenSize.height / 2.9,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      NumberFormat.currency(symbol: '₹')
                          .format(widget.productModel.discountPrice)
                          .toString(),
                      style: GoogleFonts.aBeeZee(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: UiColors.blackColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        ' ${NumberFormat.currency(symbol: '₹').format(widget.productModel.price)}',
                        style: GoogleFonts.aBeeZee(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 15,
                          color: UiColors.greyLight,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    '(${widget.productModel.discount}% off)',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      color: UiColors.blackColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Inclusive of all taxes',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: UiColors.greyLight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenSize.height * 0.01,
                ),
                Center(
                  child: GradientElevatedButton(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    width: AppConstants.screenSize.width / 1.3,
                    onPressed: () async {
                      //! Buy Now button on pressed
                      await AppService().addProductToOder(
                        productModel: widget.productModel,
                      );
                      AppUtils.snackBar(
                        title: 'Amazon',
                        content: "Product add to order",
                      );
                    },
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: UiColors.primaryButtonGradient,
                    ),
                    child: Text(
                      'Buy Now',
                      style: GoogleFonts.aBeeZee(
                        // fontSize: 25,

                        color: UiColors.blackColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstants.screenSize.height * 0.02,
                ),
                Center(
                  child: GradientElevatedButton(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    width: AppConstants.screenSize.width / 1.3,
                    onPressed: () async {
                      //! Add to cart button on pressed
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("cart")
                          .doc(widget.productModel.uid)
                          .get()
                          .then((onValue) async {
                        onValue.exists
                            ? AppUtils.snackBar(
                                title: "Amazon",
                                content:
                                    "product is already existing in cart check your cart",
                              )
                            : await AppService()
                                .addToCart(productModel: widget.productModel);
                      });
                    },
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: UiColors.primaryButtonGradient,
                    ),
                    child: Text(
                      'Add to cart',
                      style: GoogleFonts.aBeeZee(
                        // fontSize: 25,

                        color: UiColors.blackColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: showReview,
                        builder:
                            (BuildContext context, bool show, Widget? child) {
                          return TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              if (show == false) {
                                showReview.value = true;
                              } else {
                                showReview.value = false;
                              }
                            },
                            child: Text(
                              show == false ? ' Show reviews' : 'Hide reviews',
                              style: const TextStyle(
                                color: UiColors.activeCyanColor,
                                fontSize: 15,
                              ),
                            ),
                          );
                        },
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => RatingDialogWidget(
                                uid: widget.productModel.uid),
                          );
                        },
                        icon: const Icon(
                          Icons.rate_review,
                          color: UiColors.activeCyanColor,
                        ),
                        label: const Text(
                          'Add review ',
                          style: TextStyle(
                            color: UiColors.activeCyanColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: showReview,
                    builder: (BuildContext context, bool show, Widget? _) {
                      return show == true
                          ? StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('products')
                                  .doc(widget.productModel.uid)
                                  .collection('reviews')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const SizedBox();
                                } else {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final reviewModel = ReviewModel.fromJson(
                                        json: snapshot.data!.docs[index].data(),
                                      );
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                          bottom: 10,
                                        ),
                                        child: ProductReviewWidget(
                                          customerName:
                                              reviewModel.reviewerName,
                                          comments: reviewModel.description,
                                          rating: reviewModel.rating,
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const Divider();
                                    },
                                  );
                                }
                              },
                            )
                          : const SizedBox();
                    }),
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
