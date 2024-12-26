part of 'admin_bloc.dart';

sealed class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends AdminEvent {
  final BuildContext context;
  final ProductEntities product;
  final List<File> images;

  const AddProductEvent({
    required this.context,
    required this.product,
    required this.images,
  });

  @override
  List<Object> get props => [context, product, images];
}

class GetProductsEvent extends AdminEvent {
  const GetProductsEvent();

  @override
  List<Object> get props => [];
}

class DeleteProductEvent extends AdminEvent {
  final String id;
  const DeleteProductEvent({required this.id});

  @override
  List<Object> get props => [id];
}
