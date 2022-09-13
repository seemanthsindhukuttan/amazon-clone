import '../view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/colors.dart';
import '../core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, this.showActionButton = true})
      : super(key: key);
  final bool? showActionButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: UiColors.backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              height: 30,
              width: 30,
              AppConstants.amazonLogo,
            ),
            showActionButton == false
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(const SearchScreen());
                        },
                        icon: const Icon(
                          Icons.search,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
