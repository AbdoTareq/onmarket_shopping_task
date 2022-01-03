import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onmarket_shopping_task/models/product.dart';

abstract class ShoppingRepository {
  Future<List<Product>> getAllByDate();
  Future<List<Product>> getAllByRate();

  Future<void> addToCart();
  Future<void> removeFromCart();
}

class ShoppingManager implements ShoppingRepository {
  ShoppingManager._privateConstructor();

  static final ShoppingManager _instance = ShoppingManager._privateConstructor();

  final CollectionReference collection = FirebaseFirestore.instance.collection('all_products');

  final Future<QuerySnapshot<Map<String, dynamic>>> orderedQueryDate =
      FirebaseFirestore.instance.collection('all_products').orderBy('last_viewed', descending: true).get();
  final Future<QuerySnapshot<Map<String, dynamic>>> orderedQueryByRate =
      FirebaseFirestore.instance.collection('all_products').orderBy('rate', descending: true).get();

  factory ShoppingManager() {
    return _instance;
  }

  @override
  Future<List<Product>> getAllByRate() async {
    var products = <Product>[];
    var value = (await orderedQueryByRate).docs;
    for (var item in value) {
      products.add(Product.fromMap(item.data()));
    }
    return products;
  }

  @override
  Future<List<Product>> getAllByDate() async {
    var products = <Product>[];
    var value = (await orderedQueryDate).docs;
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
