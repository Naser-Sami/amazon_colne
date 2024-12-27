part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {
  final String category;
  const GetAllProductsEvent(this.category);
  @override
  List<Object> get props => [category];
}
