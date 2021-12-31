import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onmarket_shopping_task/models/product.dart';

import '../constants.dart';

abstract class ProductsRepository {
  Future<List<Product>> getAll();
}

class ProductsManager implements ProductsRepository {
  ProductsManager._privateConstructor();

  static final ProductsManager _instance = ProductsManager._privateConstructor();

  final CollectionReference collection = FirebaseFirestore.instance.collection('all_products');

  factory ProductsManager() {
    return _instance;
  }

  @override
  Future<List<Product>> getAll() async {
    var products = <Product>[];
    var value = (await collection.get()).docs;
    for (var item in value) {
      products.add(Product.fromMap(item.data() as Map<String, dynamic>));
    }
    return products;
  }
}
