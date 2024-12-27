import '/features/_features.dart';

class SearchProductsUseCase {
  final ISearchProductsRepository _repo;
  SearchProductsUseCase(this._repo);

  Future<List<ProductEntities>> call(String query) async {
    return await _repo.fetchSearchedProduct(query: query);
  }
}
