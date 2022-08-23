import 'dart:async';

import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/core/constants.dart';
import 'package:flutter/material.dart';

class LargeBannerAdsWidget extends StatefulWidget {
  const LargeBannerAdsWidget({Key? key}) : super(key: key);

  @override
  State<LargeBannerAdsWidget> createState() => _LargeBannerAdsWidgetState();
}

class _LargeBannerAdsWidgetState extends State<LargeBannerAdsWidget> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        if (AppConstants.largeAds.length - 1 > _currentIndex.value) {
          _currentIndex.value++;
        } else {
          _currentIndex.value = 0;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (BuildContext context, int index, Widget? _) {
        return Container(
          height: AppConstants.screenSize.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AppConstants.largeAds[index],
                  ))),
          child: Stack(
            children: [
              Positioned(
                bottom: -10,
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
          ),
        );
      },
    );
  }
}
