import '/features/_admin/_admin.dart';
import '../repo/_repo.dart';

class RateProductUseCase {
  final IProductDetailsRepository _repository;
  RateProductUseCase(this._repository);

  Future<void> call({
    required ProductEntities product,
    required double rating,
  }) async {
    await _repository.rateProduct(
      product: product,
      rating: rating,
    );
  }
}
