import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/top_rated_controller.dart';
import 'package:onmarket_shopping_task/export.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';

class CartController extends GetxController {
  final ShoppingRepository repository;
  CartController(this.repository);

  var cartItems = <CartItem>[].obs;
  var quantities = <RxInt>[];

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  addToCart(Product product, int index) {
    if (index < quantities.length) {
      quantities[index]++;
      if (quantities[index].value == 1) {
        cartItems.add(CartItem(product: product, quantity: quantities[index].value));
        logger.i("${cartItems.length}");
      } else {
        var index = cartItems.indexWhere((element) => element.product.name == product.name);
        cartItems[index] = CartItem(product: product, quantity: quantities[index].value);
      }
    }
  }

  decreaseItemInCart(Product product, int index) {
    if (quantities[index] > 0) {
      quantities[index]--;
      if (quantities[index].value == 0) {
        cartItems.removeWhere((element) => element.product.name == product.name);
        logger.i("${cartItems.length}");
      } else {
        var index = cartItems.indexWhere((element) => element.product.name == product.name);
        cartItems[index] = CartItem(product: product, quantity: quantities[index].value);
      }
    }
  }

  removeFromCart(Product item, int index) {
    quantities[index](0);
    cartItems.removeWhere((element) => element.product.name == item.name);
  }

  getCartItems() {
    // products(await repository.getAll());
    // logger.i("${products.length}");
    for (var _ in Get.find<TopRatedController>().products) {
      quantities.add(0.obs);
    }
  }
}
