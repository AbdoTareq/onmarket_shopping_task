import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onmarket_shopping_task/models/product.dart';

abstract class ShoppingRepository {
  Future<List<Product>> getAll();

  Future<void> addToCart();
  Future<void> removeFromCart();
}

class ShoppingManager implements ShoppingRepository {
  ShoppingManager._privateConstructor();

  static final ShoppingManager _instance = ShoppingManager._privateConstructor();

  final CollectionReference collection = FirebaseFirestore.instance.collection('all_products');
  final Future<QuerySnapshot<Map<String, dynamic>>> orderedQuery =
      FirebaseFirestore.instance.collection('all_products').orderBy('rate', descending: true).get();

  factory ShoppingManager() {
    return _instance;
  }

  @override
  Future<List<Product>> getAll() async {
    var products = <Product>[];
    var value = (await orderedQuery).docs;
    for (var item in value) {
      products.add(Product.fromMap(item.data()));
    }
    return products;
  }

  @override
  Future<void> addToCart() async {}

  @override
  Future<void> removeFromCart() async {}
}
