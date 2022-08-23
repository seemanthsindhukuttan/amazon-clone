import 'package:amazon_clone/core/colors.dart';
import 'package:amazon_clone/view/account/account_screen.dart';
import 'package:amazon_clone/view/cart/cart_screen.dart';
import 'package:amazon_clone/view/home/home_screen.dart';
import 'package:amazon_clone/view/lobby/widget/custom_bottom_nav_bar.dart';
import 'package:amazon_clone/view/menu/menu_screen.dart';
import 'package:flutter/material.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({Key? key}) : super(key: key);

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  // pagecontroller.
  late final PageController _pageController;

  //current page index.
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //page change function==>
  void _changePage(int value) {
    _currentIndex.value = value;
    _pageController.jumpToPage(value);
  } //<==

  // screens==>
  final List<Widget> _screens = [
    HomeScreen(),
    AccountScreen(),
    CartScreen(),
    MenuScreen(),
  ]; //<==

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _screens,
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (BuildContext context, int index, Widget? _) {
            return CustomBottomNavBar(
              indicatorColor: UiColors.activeCyanColor,
              onTap: _changePage,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.home_outlined,
                    color: index == 0
                        ? UiColors.activeCyanColor
                        : UiColors.blackColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: index == 1
                        ? UiColors.activeCyanColor
                        : UiColors.blackColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: index == 2
                        ? UiColors.activeCyanColor
                        : UiColors.blackColor,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.menu,
                    color: index == 3
                        ? UiColors.activeCyanColor
                        : UiColors.blackColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
