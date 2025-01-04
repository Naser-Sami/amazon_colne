import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/_features.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final RateProductUseCase rateProductUseCase;

  ProductDetailsBloc(this.rateProductUseCase) : super(ProductDetailsInitial()) {
    on<RateProductEvent>(_onRateProduct);
  }

  Future<void> _onRateProduct(
    RateProductEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    try {
      emit(ProductDetailsLoading());
      await rateProductUseCase.call(
        product: event.product,
        rating: event.rating,
      );
      emit(ProductDetailsLoaded(product: event.product));
    } catch (e) {
      emit(ProductDetailsError(error: e.toString()));
    }
  }
}
