import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/view/cart/widget/cart_tile.dart';
import 'package:amazon_clone/view/home/widgets/location_bar_widget.dart';
import 'package:amazon_clone/view/home/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
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
                  onPressed: () {},
                  child: Text(
                    'Procced to by (0) items',
                    style: GoogleFonts.aBeeZee(
                      color: UiColors.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppConstants.screenSize.width,
                  height: AppConstants.screenSize.height / 40,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: UiColors.backgroundColor,
                    height: 10,
                    thickness: 6,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    final _product = ProductModel(
                      uid: '1',
                      productName: 'nike shoe',
                      imageUrl: 'assets/nike_shoe.jpg',
                      price: 2000,
                      discount: 10,
                      sellerName: 'seemanth',
                      sellerUid: '1',
                      rating: 5,
                      ratingCount: 200,
                    );

                    return CartTileWidget(
                      productName: _product.productName,
                      price: _product.price.toString(),
                      buyerName: _product.sellerName,
                      imageUrl: _product.imageUrl,
                      deletebutton: () {},
                      saveForLaterbutton: () {},
                      productIncrementButton: () {},
                      productdecrementButton: () {},
                      seenMoreLikeThisButton: () {},
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
