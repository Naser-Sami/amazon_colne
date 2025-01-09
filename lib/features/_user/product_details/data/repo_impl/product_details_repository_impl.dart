import '/features/_features.dart';

class ProductDetailsRepositoryImpl implements IProductDetailsRepository {
  final ProductDetailsRemoteDataSource _dataSource;
  ProductDetailsRepositoryImpl(this._dataSource);

  @override
  Future<void> addToCart({required UserEntity user}) async {
    try {
      // convert to model
      final model = UserMapper.toModel(user);
      await _dataSource.addToCart(user: model);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> rateProduct({
    required ProductEntities product,
    required double rating,
  }) async {
    try {
      // convert to model
      final model = ProductMapper.toModel(product);

      await _dataSource.rateProduct(
        product: model,
        rating: rating,
      );
    } catch (e) {
      rethrow;
    }
  }
}