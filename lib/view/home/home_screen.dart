import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/home/widgets/banner_ads.dart';
import 'package:amazon_clone/view/home/widgets/category_list_view_bar.dart';
import 'package:amazon_clone/view/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _searchEditingController =
      TextEditingController();

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
        child: Column(
          children: [
            const CategoryListViewBar(),
            Divider(
              color: UiColors.greyLight.withOpacity(0.1),
              thickness: 5,
              height: 5,
            ),
            const LargeBannerAdsWidget(),
          ],
        ),
      ),
    );
  }
}
