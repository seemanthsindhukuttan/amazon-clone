import '../core/colors.dart';
import '../view/account/account_screen.dart';
import '../view/cart/cart_screen.dart';
import '../view/home/home_screen.dart';
import '../view/more/more_screen.dart';
import 'package:flutter/material.dart';
import 'widget/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
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
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
    const MoreScreen(),
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
