import '/features/_features.dart';

class RemoveFromCartUseCase {
  final IProductDetailsRepository _repository;
  RemoveFromCartUseCase(this._repository);

  Future<void> call({
    required ProductEntities product,
  }) async {
    await _repository.removeFromCart(
      product: product,
    );
  }
}
