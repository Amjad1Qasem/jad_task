// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  final int id;
  final String name;
  final int quantity;
  final int price;
  final String category;
  final String image;

  CartModel(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.category,
      required this.image});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      category: json['category'] ?? '',
      image: json['image'] ?? '',
    );
  }

  CartModel copyWith({
    int? id,
    String? name,
    int? quantity,
    int? price,
    String? category,
    String? image,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }
}
