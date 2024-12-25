import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;

  const ProductModel({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'quantity': quantity,
        'images': images,
        'category': category,
        'price': price,
        '_id': id,
      };

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
    );
  }

  ProductModel copyWith({
    String? name,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    double? price,
    String? id,
  }) =>
      ProductModel(
        name: name ?? this.name,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
        images: images ?? this.images,
        category: category ?? this.category,
        price: price ?? this.price,
        id: id ?? this.id,
      );

  // Empty product model
  factory ProductModel.empty() => ProductModel(
        name: '',
        description: '',
        quantity: 0.0,
        images: [],
        category: '',
        price: 0.0,
      );

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, quantity: $quantity, images: $images, category: $category, price: $price, id: $id)';
  }

  @override
  List<Object?> get props => [
        name,
        description,
        quantity,
        images,
        category,
        price,
        id,
      ];
}
