import 'package:flutter/material.dart';

class AppConstants {
  // sizes==>
  static const double kAppBarHeight = 110;

  static Size screenSize =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  //<==sizes
  static const String amazonLogo = "assets/amazon_Log.svg";

  static const List<String> categoriesList = [
    "Prime",
    "Mobiles",
    "Fashion",
    "Electronics",
    "Home",
    "Fresh",
    "Appliances",
    "Books, Toys",
    "Essential"
  ];

  static const List<String> categoryLogos = [
    'assets/categoryLogos/categoryLogo1.jpg',
    'assets/categoryLogos/categoryLogo2.jpg',
    'assets/categoryLogos/categoryLogo3.jpg',
    'assets/categoryLogos/categoryLogo4.jpg',
    'assets/categoryLogos/categoryLogo5.jpg',
    'assets/categoryLogos/categoryLogo6.jpg',
    'assets/categoryLogos/categoryLogo7.jpg',
    'assets/categoryLogos/categoryLogo8.jpg',
    'assets/categoryLogos/categoryLogo9.jpg',
  ];

  static const List<String> largeAds = [
    "assets/largeAds/largeAds1.jpg",
    "assets/largeAds/largeAds2.jpg",
    "assets/largeAds/largeAds3.jpg",
    "assets/largeAds/largeAds4.jpg",
    "assets/largeAds/largeAds5.jpg",
  ];

  static const List<String> smallAds = [
    "assets/smallAds/smallAds1.jpg",
    "assets/smallAds/smallAds2.jpg",
    "assets/smallAds/smallAds3.jpg",
    "assets/smallAds/smallAds4.jpg",
  ];

  static const List<String> adItemNames = [
    "Amazon Pay",
    "Recharge",
    "Rewards",
    "Pay Bills"
  ];

//   static const String amazonLogo =
//       "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png";
}
