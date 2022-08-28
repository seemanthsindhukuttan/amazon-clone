import 'dart:developer';

import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/home/widgets/search_bar_widget.dart';
import 'package:amazon_clone/view/search_result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(
          showBackButton: true,
          isReadOnly: false,
          autofocus: true,
          onSubmitted: (query) {
            Get.to(ResultScreen(query: query));
            log(query);
          },
        ),
      ),
    );
  }
}
