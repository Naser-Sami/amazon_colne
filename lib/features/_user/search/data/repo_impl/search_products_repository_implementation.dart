import '/features/_features.dart';

class SearchProductsRepositoryImplementation implements ISearchProductsRepository {
  final SearchRemoteDataSource _dataSource;
  SearchProductsRepositoryImplementation(this._dataSource);

  @override
  Future<List<ProductEntities>> fetchSearchedProduct({required String query}) async {
    try {
      final models = await _dataSource.fetchSearchedProduct(query: query);
      List<ProductEntities> entities = models.map((model) {
        return ProductEntities(
          id: model.id,
          name: model.name,
          description: model.description,
          quantity: model.quantity,
          images: model.images,
          category: model.category,
          price: model.price,
          rating: model.rating.map((e) => RatingMapper.toEntity(e)).toList(),
        );
      }).toList();

      return entities;
    } catch (e) {
      rethrow;
    }
  }
}
