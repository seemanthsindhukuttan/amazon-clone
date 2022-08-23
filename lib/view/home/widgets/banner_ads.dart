import 'dart:async';

import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';

class LargeBannerAdsWidget extends StatelessWidget {
  const LargeBannerAdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _currentIndex = ValueNotifier(0);

    Timer.periodic(
      const Duration(seconds: 3),
      (Timer timer) {
        if (AppConstants.largeAds.length - 1 > _currentIndex.value) {
          _currentIndex.value++;
        } else {
          _currentIndex.value = 0;
        }
      },
    );

    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (BuildContext context, int index, Widget? _) {
            return Image.asset(
              AppConstants.largeAds[index],
            );
          },
        ),
        Positioned(
          bottom: -0,
          child: Container(
            width: AppConstants.screenSize.width,
            height: AppConstants.screenSize.height * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  UiColors.backgroundColor,
                  UiColors.backgroundColor.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -1,
          child: SizedBox(
            width: AppConstants.screenSize.width,
            height: AppConstants.screenSize.height / 5.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.smallAds.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenSize.width / 40,
                ),
                child: Container(
                  width: AppConstants.screenSize.height / 6.4,
                  decoration: BoxDecoration(
                    color: UiColors.backgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AppConstants.smallAds[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
