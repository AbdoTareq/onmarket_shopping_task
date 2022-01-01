import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onmarket_shopping_task/models/product.dart';

import '../constants.dart';

abstract class ShoppingRepository {
  Future<List<Product>> getAll();
}

class ShoppingManager implements ShoppingRepository {
  ShoppingManager._privateConstructor();

  static final ShoppingManager _instance = ShoppingManager._privateConstructor();

  final CollectionReference collection = FirebaseFirestore.instance.collection('all_products');

  factory ShoppingManager() {
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