import '/features/_features.dart';

class AddToCartUseCase {
  final IProductDetailsRepository _repository;
  AddToCartUseCase(this._repository);

  Future<void> call({
    required UserEntity user,
  }) async {
    await _repository.addToCart(
      user: user,
    );
  }
}
