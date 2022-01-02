import 'dart:convert';

class QuantityWithKey {
  final int quantity;
  final String name;
  QuantityWithKey({
    required this.quantity,
    required this.name,
  });

  QuantityWithKey copyWith({
    int? quantity,
    String? name,
  }) {
    return QuantityWithKey(
      quantity: quantity ?? this.quantity,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'name': name,
    };
  }

  factory QuantityWithKey.fromMap(Map<String, dynamic> map) {
    return QuantityWithKey(
      quantity: map['quantity']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuantityWithKey.fromJson(String source) => QuantityWithKey.fromMap(json.decode(source));

  @override
  String toString() => 'QuantityWithKey(quantity: $quantity, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuantityWithKey &&
      other.quantity == quantity &&
      other.name == name;
  }

  @override
  int get hashCode => quantity.hashCode ^ name.hashCode;
}
