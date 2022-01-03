import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';

class HomeController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void goToIndex(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
