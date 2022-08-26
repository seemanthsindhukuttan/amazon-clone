import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/account/widgets/appbar_widget.dart';
import 'package:amazon_clone/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
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
                      'Liya', //todo: change name
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
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1604004555489-723a93d6ce74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                            scale: 1 / 1),
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
                onPressed: () {
                  //! Sign Out button on pressed
                  //TODO  on press Sign Out
                },
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: UiColors.PrimaryButtonGradient,
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
                  //TODO  on press Sell button
                },
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: UiColors.PrimaryButtonGradient,
                ),
                child: Text(
                  'Sell',
                  style: GoogleFonts.aBeeZee(
                    color: UiColors.blackColor,
                  ),
                ),
              ),
            ),
            ProductShowCaseListView(
              title: 'Your Orders',
              listView: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const ProductShowCardWidget(
                    image: 'assets/nike_shoe.jpg',
                    productName:
                        'Nike mens Nike Air Max 270 React Se Running Shoe',
                  );
                },
              ),
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 5, top: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'Nike Shoe',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: UiColors.blackColor,
                      ),
                    ),
                    subtitle: Text(
                      'Address Somewhere on Earth',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: UiColors.greyLight,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.check,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
