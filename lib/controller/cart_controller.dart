import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/shopping_controller.dart';
import 'package:onmarket_shopping_task/export.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';
import 'package:onmarket_shopping_task/utils/utils.dart';

class CartController extends GetxController {
  final ShoppingRepository repository;
  CartController(this.repository);

  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    initailCart();
    super.onInit();
  }

  void initailCart() {
    update();
  }

  removeAnyZeroQuantityItem() {
    for (var item in cartItems) {
      if (item.quantity.value == 0) {
        cartItems.remove(item);
      }
    }
  }

  increaseItemInCart(String productName) async {
    CartItem? cartItem = cartItems.firstWhereOrNull((item) => item.product.name == productName);

    if (cartItem != null) {
      cartItem.quantity.value++;
    } else {
      Product product = await repository.getProductByName(productName);
      CartItem tempCartItem = CartItem(product: product, quantity: 1.obs);
      cartItems.add(tempCartItem);
    }
  }

  decreaseItemInCart(String productName) {
    CartItem? cartItem = cartItems.firstWhereOrNull((item) => item.product.name == productName);

    if (cartItem == null) {
      return;
    } else if (cartItem.quantity.value == 1) {
      cartItems.remove(cartItem);
    } else {
      cartItem.quantity.value--;
    }
  }

  int getQuantityByProductName(String productName) {
    CartItem? cartItem = cartItems.firstWhereOrNull((item) => item.product.name == productName);

    if (cartItem == null) {
      return 0;
    } else {
      return cartItem.quantity.value;
    }
  }

  removeFromCart(String productId) {
    cartItems.removeWhere((element) => element.product.id == productId);
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  checkout() {
    initailCart();
    Get.forceAppUpdate();
    Get.back();
    showSuccessSnack(title: 'success', text: 'Order is placed');
  }
}
