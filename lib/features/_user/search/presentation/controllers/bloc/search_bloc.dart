import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/_features.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProductsUseCase _searchProductsUseCase;

  SearchBloc(this._searchProductsUseCase) : super(SearchInitial()) {
    on<SearchProductEvent>(_onSearchProduct);
  }

  Future<void> _onSearchProduct(
      SearchProductEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final products = await _searchProductsUseCase(event.query);
      emit(SearchLoaded(products));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
