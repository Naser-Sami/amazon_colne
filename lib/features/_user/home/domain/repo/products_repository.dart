import '/features/_features.dart';

abstract class IProductsRepository {
  Future<List<ProductEntities>> getProducts(String category);
  Future<ProductEntities> getDealOfDay();
}
