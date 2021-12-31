import 'package:get/get.dart';
import 'package:onmarket_shopping_task/models/product.dart';
import 'package:onmarket_shopping_task/repos/product_repo.dart';

import '../constants.dart';

class TopRatedController extends GetxController {
  final ProductsRepository repository;
  TopRatedController(this.repository);
  var products = <Product>[].obs;

  @override
  void onReady()async {
    await getProducts();
    super.onReady();
  }

  Future<void> getProducts() async {
    products(await repository.getAll());
    logger.i("${products.length}");
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
