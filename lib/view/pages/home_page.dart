import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/home_controller.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';
import 'package:onmarket_shopping_task/view/pages/most_selling_page.dart';
import 'package:onmarket_shopping_task/view/pages/recently_viewed_page.dart';
import 'package:onmarket_shopping_task/view/pages/top_rated_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> _widgetOptions = <Widget>[
    const TopRatedPage(),
    const MostSellingPage(),
    const RecentlyViewedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _widgetOptions,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) => controller.selectedIndex = value,
      ),
      bottomNavigationBar: Obx(
        () => SafeArea(
          child: SalomonBottomBar(
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.goToIndex(index),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Top Rated'.tr),
                selectedColor: kPrimaryColor,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.auto_graph),
                title: Text('Most Selling'.tr),
                selectedColor: kPrimaryColor,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.history),
                title: Text('history'.tr),
                selectedColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
