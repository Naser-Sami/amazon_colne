import '/features/_features.dart';

class ProductRepositoryImplementation implements IProductsRepository {
  final ProductsRemoteDataSource _dataSource;
  ProductRepositoryImplementation(this._dataSource);

  @override
  Future<List<ProductEntities>> getProducts(String category) async {
    try {
      final models = await _dataSource.getProducts(category);

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

  @override
  Future<ProductEntities> getDealOfDay() async {
    try {
      final model = await _dataSource.getDealOfDay();
      return ProductMapper.toEntity(model);
    } catch (e) {
      rethrow;
    }
  }
}
