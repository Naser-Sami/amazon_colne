import '/features/_features.dart';

class GetDealOfDayUseCase {
  final IProductsRepository _productsRepository;
  GetDealOfDayUseCase(this._productsRepository);

  Future<ProductEntities> call() async {
    return await _productsRepository.getDealOfDay();
  }
}
