import 'package:amazon_clone/controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'widgets/product_list.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../view/home/widgets/banner_ads.dart';
import '../../view/home/widgets/category_list_view_bar.dart';
import '../../view/home/widgets/location_bar_widget.dart';
import '../../view/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(
          isReadOnly: true,
          autofocus: false,
        ),
      ),
      body: RefreshIndicator(
        color: UiColors.activeCyanColor,
        onRefresh: () async {
          await Get.find<HomeScreenController>().getData();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              Column(
                children: const [
                  CategoryListViewBar(),
                  Divider(color: UiColors.backgroundColor, height: 5),
                  LargeBannerAdsWidget(),
                  ProductListWidget(),
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
      ),
    );
  }
}
