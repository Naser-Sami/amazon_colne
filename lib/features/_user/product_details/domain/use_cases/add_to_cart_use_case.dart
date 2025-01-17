import '/features/_features.dart';

class AddToCartUseCase {
  final IProductDetailsRepository _repository;
  AddToCartUseCase(this._repository);

  Future<void> call({
    required ProductEntities product,
  }) async {
    await _repository.addToCart(
      product: product,
    );
  }
}
