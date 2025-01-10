part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductEntities product;
  const ProductDetailsLoaded({required this.product});
  @override
  List<Object> get props => [product];
}

final class ProductDetailsError extends ProductDetailsState {
  final String error;
  const ProductDetailsError({required this.error});
  @override
  List<Object> get props => [error];
}
