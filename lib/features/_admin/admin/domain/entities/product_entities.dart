import 'package:amazon_clone/features/_features.dart';
import 'package:equatable/equatable.dart';

class ProductEntities extends Equatable {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String id;
  final List<RatingEntities> rating;

  const ProductEntities({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    required this.id,
    required this.rating,
  });

  ProductEntities copyWith({
    String? name,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    double? price,
    String? id,
    List<RatingEntities>? rating,
  }) {
    return ProductEntities(
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      category: category ?? this.category,
      price: price ?? this.price,
      id: id ?? this.id,
      rating: rating ?? this.rating,
    );
  }

  factory ProductEntities.empty() => ProductEntities(
        id: '',
        name: '',
        description: '',
        quantity: 0.0,
        images: [],
        category: '',
        price: 0.0,
        rating: [],
      );

  @override
  String toString() {
    return 'ProductEntities(name: $name, description: $description, quantity: $quantity, images: $images, category: $category, price: $price, id: $id, rating: $rating)';
  }

  @override
  List<Object?> get props =>
      [name, description, quantity, images, category, price, id, rating];
}
