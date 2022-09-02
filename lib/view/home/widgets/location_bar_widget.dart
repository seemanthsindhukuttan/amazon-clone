import 'package:amazon_clone/controller/user_detial_bar_controller.dart';
import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationBarWidget extends StatelessWidget {
  const LocationBarWidget({Key? key, required this.offset}) : super(key: key);
  final double offset;
  @override
  Widget build(BuildContext context) {
    final userDetialBarController = Get.put(UserDetialBarController());

    return Positioned(
      top: -offset / 0.8,
      child: Container(
        width: AppConstants.screenSize.width,
        height: AppConstants.kAppBarHeight / 2.5,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: UiColors.lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.location_on_outlined,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Obx(() => Text(
                      "Deliver to ${userDetialBarController.userDetials.value.username}- ${userDetialBarController.userDetials.value.address}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
