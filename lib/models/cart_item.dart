import 'dart:convert';

import 'package:get/state_manager.dart';

import 'package:onmarket_shopping_task/models/product.dart';

class CartItem {
  final Product product;
  final RxInt quantity;
  CartItem({
    required this.product,
    required this.quantity,
  });

  double get price => quantity.value * (product.hasDiscount ? product.discountedPrice : product.price);

  CartItem copyWith({
    Product? product,
    RxInt? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity.value,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromMap(map['product']),
      quantity:  map['quantity']?.toInt() ?? 0.obs,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source));

  @override
  String toString() => 'CartItem(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem && other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
