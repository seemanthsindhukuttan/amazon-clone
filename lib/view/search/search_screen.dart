import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: SearchBarWidget(
          showBackButton: true,
          isReadOnly: false,
          autofocus: true,
        ),
      ),
    );
  }
}
