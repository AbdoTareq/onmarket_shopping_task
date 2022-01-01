import 'package:get/get.dart';
import 'package:onmarket_shopping_task/export.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';

class CartController extends GetxController {
  final ShoppingRepository repository;
  CartController(this.repository);

  var cartItems = <CartItem>[].obs;

  @override
  void onReady() async {
    await getCartItems();
    super.onReady();
  }

  Future<void> getCartItems() async {
    // products(await repository.getAll());
    // logger.i("${products.length}");
  }
}
