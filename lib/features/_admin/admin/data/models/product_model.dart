import '/features/_features.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String id;
  final List<RatingModel> rating;

  const ProductModel({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    required this.id,
    required this.rating,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'quantity': quantity,
        'images': images,
        'category': category,
        'price': price,
        '_id': id,
        'ratings': rating,
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
      rating: map['ratings'] == null
          ? []
          : List<RatingModel>.from(
              map['ratings']?.map(
                (x) => RatingModel.fromMap(x),
              ),
            ),
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
    List<RatingModel>? rating,
  }) =>
      ProductModel(
        name: name ?? this.name,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
        images: images ?? this.images,
        category: category ?? this.category,
        price: price ?? this.price,
        id: id ?? this.id,
        rating: rating ?? this.rating,
      );

  // Empty product model
  factory ProductModel.empty() => ProductModel(
      id: '',
      name: '',
      description: '',
      quantity: 0.0,
      images: [],
      category: '',
      price: 0.0,
      rating: []);

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, quantity: $quantity, images: $images, category: $category, price: $price, id: $id, rating: $rating)';
  }

  @override
  List<Object?> get props =>
      [name, description, quantity, images, category, price, id, rating];
}
