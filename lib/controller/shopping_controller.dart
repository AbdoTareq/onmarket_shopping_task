import 'package:get/get.dart';
import 'package:onmarket_shopping_task/repos/shopping_repo.dart';

import '../export.dart';

class ShoppingController extends GetxController {
  final ShoppingRepository repository;
  ShoppingController(this.repository);
  var productsBydate = <Product>[].obs;
  var productsByRate = <Product>[].obs;

  @override
  void onReady() async {
    await getProducts();
    super.onReady();
  }

  Future<void> getProducts() async {
    productsBydate(await repository.getAllByDate());
    productsByRate(await repository.getAllByRate());
  }
}
