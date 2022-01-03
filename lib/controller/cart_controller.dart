import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/top_rated_controller.dart';
import 'package:onmarket_shopping_task/export.dart';
import 'package:onmarket_shopping_task/models/quntityWithKey.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';
import 'package:onmarket_shopping_task/utils/utils.dart';

class CartController extends GetxController {
  final ShoppingRepository repository;
  CartController(this.repository);

  var cartItems = <CartItem>[].obs;
  var quantities = <QuantityWithKey>[];

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  increaseItemInCart(Product product, int index) {
    logger.i("plus ${index}");
    if (index < quantities.length) {
      quantities[index].quantity++;
      if (quantities[index].quantity.value == 1) {
        cartItems.add(CartItem(product: product, quantity: quantities[index].quantity.value));
        // logger.i("${cartItems.length}");
      } else {
        var inx = cartItems.indexWhere((element) => element.product.name == product.name);
        cartItems[inx] = CartItem(product: product, quantity: quantities[inx].quantity.value);
      }
    }
  }

  decreaseItemInCart(Product product, int index) {
    logger.i("minus ${index}");

    if (quantities[index].quantity > 0) {
      quantities[index].quantity--;
      if (quantities[index].quantity.value == 0) {
        cartItems.removeWhere((element) => element.product.name == product.name);
        // logger.i("${cartItems.length}");
      } else {
        var inx = cartItems.indexWhere((element) => element.product.name == product.name);
        cartItems[inx] = CartItem(product: product, quantity: quantities[inx].quantity.value);
      }
    }
  }

  removeFromCart(Product product) {
    for (var i = 0; i < quantities.length; i++) {
      if (quantities[i].name == product.name) {
        quantities[i].quantity(0);
      }
    }
    cartItems.removeWhere((element) => element.product.name == product.name);
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  checkout() {
    cartItems([]);
    quantities = [];
    Get.forceAppUpdate();
    getCartItems();
    Get.back();
    showSuccessSnack(title: 'success', text: 'Order is placed');
  }

  getCartItems() {
    for (var _ in Get.find<TopRatedController>().products) {
      quantities.add(QuantityWithKey(quantity: 0.obs, name: _.name));
    }
  }
}
