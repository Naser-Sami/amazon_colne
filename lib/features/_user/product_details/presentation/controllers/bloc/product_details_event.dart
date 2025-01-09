part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class RateProductEvent extends ProductDetailsEvent {
  final ProductEntities product;
  final double rating;
  const RateProductEvent({
    required this.product,
    required this.rating,
  });

  @override
  List<Object> get props => [product, rating];
}

class AddToCartEvent extends ProductDetailsEvent {
  final UserEntity user;
  const AddToCartEvent({required this.user});
  @override
  List<Object> get props => [user];
}
