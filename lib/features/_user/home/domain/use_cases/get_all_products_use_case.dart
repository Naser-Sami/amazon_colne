import '/features/_features.dart';

class GetAllProductsUseCase {
  final IProductsRepository _productsRepository;
  GetAllProductsUseCase(this._productsRepository);

  Future<List<ProductEntities>> call(String category) async {
    return await _productsRepository.getProducts(category);
  }
}
