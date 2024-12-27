import 'dart:math';

import '/features/_features.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUseCase _getAllProductsUseCase;

  ProductsBloc(this._getAllProductsUseCase) : super(ProductsInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
  }

  Future<void> _onGetAllProducts(
    GetAllProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await _getAllProductsUseCase(event.category);
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsError(error: e.toString()));
    }
  }
}
