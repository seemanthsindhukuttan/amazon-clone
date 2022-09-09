import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../home/widgets/search_bar_widget.dart';
import '../search_result/result_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppConstants.kAppBarHeight),
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
