// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/colors.dart';
import '../core/constants.dart';
import '../view/search/search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    this.isReadOnly = false,
    this.showBackButton = false,
    this.autofocus = false,
    this.onFieldSubmitted,
  }) : super(key: key);
  final bool isReadOnly;
  final bool showBackButton;
  final bool autofocus;

  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
      borderSide: BorderSide(
        color: UiColors.greyLight,
      ),
    );
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          showBackButton == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 40),
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
          Padding(
            padding: EdgeInsets.only(
              top: AppConstants.screenSize.height * 0.04,
              left: showBackButton == true
                  ? 0
                  : AppConstants.screenSize.width * 0.03,
            ),
            child: Container(
              height: AppConstants.screenSize.height / 19,
              width: showBackButton == false
                  ? AppConstants.screenSize.width * 0.85
                  : AppConstants.screenSize.width * 0.75,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: UiColors.blackColor.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                onFieldSubmitted: onFieldSubmitted,
                onTap: () => Get.to(
                  const SearchScreen(),
                ),
                readOnly: isReadOnly,
                autofocus: autofocus,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                  contentPadding: EdgeInsets.zero,
                  fillColor: UiColors.backgroundColor,
                  prefixIcon: const Icon(
                    Icons.search_sharp,
                    color: UiColors.blackColor,
                    size: 23,
                  ),
                  suffixIcon: showBackButton == true
                      ? const SizedBox()
                      : Icon(
                          Icons.qr_code_scanner,
                          color: UiColors.greyLight,
                          size: 23,
                        ),
                  hintText: 'Search Amazon.in',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
