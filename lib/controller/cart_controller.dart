import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/shopping_controller.dart';
import 'package:onmarket_shopping_task/export.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';
import 'package:onmarket_shopping_task/utils/utils.dart';

class CartController extends GetxController {
  final ShoppingRepository repository;
  CartController(this.repository);

  var cartItems = <CartItem>[].obs;
  var tempCartItems = <CartItem>[].obs;

  @override
  void onInit() {
    initailCart();
    super.onInit();
  }

  void initailCart() {
    tempCartItems([]);
    update();
    for (var item in Get.find<ShoppingController>().productsByRate) {
      tempCartItems.add(CartItem(product: item, quantity: 0.obs));
    }
  }

  removeAnyZeroQuantityItem() {
    for (var item in cartItems) {
      if (item.quantity.value == 0) {
        cartItems.remove(item);
      }
    }
  }

  increaseItemInCart(int index) {
    tempCartItems[index].quantity.value++;
    if (tempCartItems[index].quantity.value == 1) {
      cartItems.add(tempCartItems[index]);
    } else {
      updateItemQuantity(index);
    }
    removeAnyZeroQuantityItem();
  }

  decreaseItemInCart(int index) {
    if (tempCartItems[index].quantity > 0) {
      tempCartItems[index].quantity.value--;
    } else {
      updateItemQuantity(index);
    }
    removeAnyZeroQuantityItem();
  }

  void updateItemQuantity(int index) {
    var cartItem =
        cartItems.firstWhere((element) => element.product.name == tempCartItems[index].product.name);
    cartItems.removeWhere((element) => element.product.name == cartItem.product.name);
    cartItems.add(tempCartItems[index]);
  }

  removeFromCart(CartItem cartItem) {
    cartItems.removeWhere((element) => element.product.name == cartItem.product.name);
    int index = tempCartItems.indexOf(cartItem);
    tempCartItems[index].quantity.value = 0;
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in tempCartItems) {
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
