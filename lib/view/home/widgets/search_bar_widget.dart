import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    this.isReadOnly = false,
    this.showBackButton = false,
    this.autofocus = false,
  }) : super(key: key);
  final bool isReadOnly;
  final bool showBackButton;
  final bool autofocus;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showBackButton == true
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: AppConstants.screenSize.height * 0.01,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: AppConstants.screenSize.height * 0.01,
                left: showBackButton == true
                    ? 0
                    : AppConstants.screenSize.width * 0.03,
              ),
              child: SizedBox(
                height: AppConstants.screenSize.height * 0.05,
                child: TextFormField(
                  onTap: () => Get.to(
                    const SearchScreen(),
                  ),
                  readOnly: isReadOnly,
                  autofocus: autofocus,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(bottom: 10),
                    prefixIcon: const Icon(
                      Icons.search_sharp,
                      color: UiColors.blackColor,
                    ),
                    hintText: 'Search Amazon.in',
                    suffixIcon: showBackButton == true
                        ? const SizedBox()
                        : const Icon(Icons.qr_code_scanner),
                    filled: true,
                    fillColor: UiColors.backgroundColor,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: AppConstants.screenSize.height * 0.01,
            ),
            child: IconButton(
              splashRadius: 2,
              onPressed: () {},
              icon: const Icon(
                Icons.mic_none_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
