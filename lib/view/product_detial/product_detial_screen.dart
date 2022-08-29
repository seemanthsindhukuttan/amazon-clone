import 'package:amazon_clone/view/product_detial/widgets/product_review_widget.dart';
import 'package:amazon_clone/view/search_result/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../widgets/gradient_button.dart';
import '../home/widgets/location_bar_widget.dart';
import '../home/widgets/search_bar_widget.dart';

class ProductDetialScreen extends StatefulWidget {
  const ProductDetialScreen({Key? key}) : super(key: key);

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

  bool showReview = false;

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
                        'seller name',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: UiColors.activeCyanColor,
                        ),
                      ),
                      const RatingStarWidget(
                        rating: 5,
                        ratingCount: 5,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.screenSize.width * 0.03,
                    vertical: AppConstants.screenSize.width * 0.04,
                  ),
                  child: Text(
                    'Nike Air Zoom Pegasus 37 Mens TECH Running',
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
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/nike_shoe.jpg',
                    height: AppConstants.screenSize.height / 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Price:  ',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: UiColors.greyLight,
                      ),
                    ),
                    Text(
                      '₹8,314.00',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: UiColors.blackColor,
                      ),
                    ),
                  ],
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
                  height: AppConstants.screenSize.height * 0.02,
                ),
                Center(
                  child: GradientElevatedButton(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    width: AppConstants.screenSize.width / 1.3,
                    onPressed: () {
                      //! Buy Now button on pressed
                    },
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: UiColors.PrimaryButtonGradient,
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
                    onPressed: () {
                      //! Add to cart button on pressed
                    },
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: UiColors.PrimaryButtonGradient,
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
                  padding: EdgeInsets.only(
                    top: AppConstants.screenSize.height * 0.02,
                    left: AppConstants.screenSize.width * 0.03,
                    bottom: AppConstants.screenSize.height * 0.03,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Show reviews',
                      style: TextStyle(
                        color: UiColors.activeCyanColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                showReview == true
                    ? const SizedBox()
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const Divider(thickness: 0.5),
                        itemBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: ProductReviewWidget(
                              customerName: 'Seemanth',
                              comments: 'good product, bulid quality  is super',
                              rating: 4,
                            ),
                          );
                        },
                      ),
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
