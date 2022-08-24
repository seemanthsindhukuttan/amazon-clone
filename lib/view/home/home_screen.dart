import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/home/widgets/banner_ads.dart';
import 'package:amazon_clone/view/home/widgets/category_list_view_bar.dart';
import 'package:amazon_clone/view/home/widgets/location_bar_widget.dart';
import 'package:amazon_clone/view/home/widgets/product_show_card.dart';
import 'package:amazon_clone/view/home/widgets/product_showcase_List_view.dart';
import 'package:amazon_clone/view/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchEditingController =
      TextEditingController();
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(
          isReadOnly: true,
          autofocus: false,
          controller: _searchEditingController,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Column(
              children: [
                const CategoryListViewBar(),
                const Divider(
                  color: UiColors.backgroundColor,
                  height: 5,
                ),
                const LargeBannerAdsWidget(),
                ProductShowCaseListView(
                  title: 'Upto 10% Off',
                  listView: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const ProductShowCardWidget(
                        image: 'assets/tshirt.jpg',
                        productName: 'Puma Unisex-Child Regular T-Shirt',
                      );
                    },
                  ),
                ),
                ProductShowCaseListView(
                  title: 'Upto 25% Off',
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
                ProductShowCaseListView(
                  title: 'Upto 35% Off',
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
                ProductShowCaseListView(
                  title: 'Upto 50% Off',
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
                ProductShowCaseListView(
                  title: 'Upto 60% Off',
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
                ProductShowCaseListView(
                  title: 'Upto 70% Off',
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
