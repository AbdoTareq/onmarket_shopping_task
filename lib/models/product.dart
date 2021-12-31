import 'dart:convert';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final bool hasDiscount;
  final double discountedPrice;
  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.hasDiscount,
    required this.discountedPrice,
  });

  Product copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? description,
    double? price,
    bool? hasDiscount,
    double? discountedPrice,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      hasDiscount: hasDiscount ?? this.hasDiscount,
      discountedPrice: discountedPrice ?? this.discountedPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'price': price,
      'hasDiscount': hasDiscount,
      'discountedPrice': discountedPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      hasDiscount: map['hasDiscount'] ?? false,
      discountedPrice: map['discountedPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, imageUrl: $imageUrl, description: $description, price: $price, hasDiscount: $hasDiscount, discountedPrice: $discountedPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.description == description &&
      other.price == price &&
      other.hasDiscount == hasDiscount &&
      other.discountedPrice == discountedPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      description.hashCode ^
      price.hashCode ^
      hasDiscount.hashCode ^
      discountedPrice.hashCode;
  }
}
