part of 'admin_bloc.dart';

sealed class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

final class AdminInitial extends AdminState {}

final class AdminLoadingState extends AdminState {}

final class AdminSuccessState extends AdminState {
  final List<ProductEntities> products;
  const AdminSuccessState(this.products);

  @override
  List<Object> get props => [products];
}

final class AdminFailureState extends AdminState {
  final String message;
  const AdminFailureState(this.message);

  @override
  List<Object> get props => [message];
}
