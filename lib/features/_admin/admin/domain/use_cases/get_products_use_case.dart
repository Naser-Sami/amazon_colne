import '../domain.dart';

class GetProductsUseCase {
  final IAdminRepository repo;
  GetProductsUseCase(this.repo);

  Future<List<ProductEntities>> call() async {
    return await repo.getProducts();
  }
}
