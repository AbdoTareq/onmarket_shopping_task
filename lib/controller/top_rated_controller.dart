import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:onmarket_shopping_task/repos/product_repo.dart';

import '../constants.dart';

class TopRatedController extends GetxController {
  final ShoppingRepository repository;
  TopRatedController(this.repository);

  var products = <Product>[].obs;
  final RxInt _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(value) => this._selectedIndex.value = value;

  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void goToIndex(int index) {
    selectedIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  void onReady() async {
    await getProducts();
    super.onReady();
  }

  Future<void> getProducts() async {
    products(await repository.getAll());
    logger.i("${products.length}");
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
