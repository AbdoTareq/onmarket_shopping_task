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

  updateCartItem(int quantityIndex, Product product) {
    var cartItemIndex = cartItems.indexWhere((element) => element.product.name == product.name);
    logger.i("index $quantityIndex cartItemIndex $cartItemIndex");
    cartItems[cartItemIndex] =
        cartItems[cartItemIndex].copyWith(quantity: quantities[quantityIndex].quantity.value);
  }

  increaseItemInCart(Product product, int quantityIndex) {
    if (quantityIndex < quantities.length) {
      quantities[quantityIndex].quantity++;
      if (quantities[quantityIndex].quantity.value == 1) {
        cartItems.add(CartItem(product: product, quantity: quantities[quantityIndex].quantity.value));
      } else {
        updateCartItem(quantityIndex, product);
      }
    }
  }

  decreaseItemInCart(Product product, int quantityIndex) {
    if (quantities[quantityIndex].quantity > 0) {
      quantities[quantityIndex].quantity--;
      if (quantities[quantityIndex].quantity.value == 0) {
        cartItems.removeWhere((element) => element.product.name == product.name);
      } else {
        updateCartItem(quantityIndex, product);
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
