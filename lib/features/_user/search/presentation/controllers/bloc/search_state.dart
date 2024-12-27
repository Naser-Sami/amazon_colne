part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<ProductEntities> products;
  const SearchLoaded(this.products);
  @override
  List<Object> get props => [products];
}

final class SearchError extends SearchState {
  final String error;
  const SearchError(this.error);
  @override
  List<Object> get props => [error];
}
