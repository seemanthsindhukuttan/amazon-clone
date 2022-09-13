import '../../model/order_request_model.dart';
import 'widgets/oder_request_card.dart';
import '../product_detial/product_detial_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../controller/user_detial_bar_controller.dart';
import '../../core/constants.dart';
import '../../core/utils.dart';
import '../../model/product_model.dart';
import '../../widgets/appbar_widget.dart';
import '../selling/selling_screen.dart';
import '../sgin_in%20or%20login/sgin_in_or_create.dart';
import '../../widgets/gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors.dart';
import '../home/widgets/product_show_card.dart';
import '../home/widgets/product_showcase_List_view.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: AppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppConstants.kAppBarHeight / 2,
              width: AppConstants.screenSize.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: UiColors.backgroundGradient,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Container(
                height: AppConstants.kAppBarHeight / 2,
                width: AppConstants.screenSize.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      UiColors.backgroundColor,
                      UiColors.backgroundColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        'Hello,',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      Get.find<UserDetialController>().userDetials().username,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppConstants.screenSize.width / 50,
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: UiColors.whiteBackgroundColor,
                        child: IconButton(
                          splashRadius: 1,
                          color: UiColors.greyLight,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                  //! Sign Out button on pressed
                  FirebaseAuth.instance.signOut();

                  await Get.deleteAll();
                  Get.off(const SginInOrCreate());
                },
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: UiColors.primaryButtonGradient,
                ),
                child: Text(
                  'Sign Out',
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
                onPressed: () {
                  //! Sell button on pressed
                  Get.to(const SellingScreen());
                },
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: UiColors.primaryButtonGradient,
                ),
                child: Text(
                  'Sell',
                  style: GoogleFonts.aBeeZee(
                    color: UiColors.blackColor,
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('orders')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: AppUtils.appCircularProgressIndicator);
                } else if (snapshot.data!.docs.isNotEmpty) {
                  return ProductShowCaseListView(
                    title: 'Your Orders',
                    listView: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final productModel = ProductModel.fromJson(
                            json: snapshot.data!.docs[index].data());
                        return ProductShowCardWidget(
                          image: productModel.imageUrl,
                          productName: productModel.productName,
                          onTap: () {
                            Get.to(
                              ProductDetialScreen(productModel: productModel),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                'Order Requests',
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: UiColors.blackColor,
                ),
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("orderRequest")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        child: AppUtils.appCircularProgressIndicator),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Center(
                      child: Text(
                        'Sell your product to get order request',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: UiColors.blackColor,
                        ),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final model = OrderRequestModel.fromJson(
                          json: snapshot.data!.docs[index].data());

                      return OrderRequestCart(
                        productName: model.productName,
                        buyerName: model.buyerName,
                        buyerAddress: model.buyerAddress,
                        trailingButton: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("orderRequest")
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
