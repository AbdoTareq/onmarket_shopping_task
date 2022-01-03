import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/cart_controller.dart';
import 'package:onmarket_shopping_task/controller/shopping_controller.dart';
import 'package:onmarket_shopping_task/controller/home_controller.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put<ShoppingController>(ShoppingController(ShoppingManager()));
    Get.lazyPut<CartController>(() => CartController(ShoppingManager()));
  }
}
