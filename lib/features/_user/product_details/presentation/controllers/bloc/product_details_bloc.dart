import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/_features.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final RateProductUseCase _rateProductUseCase;
  final AddToCartUseCase _addToCartUseCase;

  ProductDetailsBloc(this._rateProductUseCase, this._addToCartUseCase)
      : super(ProductDetailsInitial()) {
    on<RateProductEvent>(_onRateProduct);
    on<AddToCartEvent>(_onAddToCart);
  }

  Future<void> _onRateProduct(
    RateProductEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    try {
      emit(ProductDetailsLoading());
      await _rateProductUseCase.call(
        product: event.product,
        rating: event.rating,
      );
      emit(ProductDetailsLoaded(product: event.product));
    } catch (e) {
      emit(ProductDetailsError(error: e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    try {
      emit(AddToCartLoadingState());
      await _addToCartUseCase.call(
        user: event.user,
      );
      emit(AddToCartLoadedState(user: event.user));
    } catch (e) {
      emit(AddTodCartErrorState(error: e.toString()));
    }
  }
}
