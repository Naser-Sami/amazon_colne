import '/features/_features.dart';

abstract class ISearchProductsRepository {
  Future<List<ProductEntities>> fetchSearchedProduct({
    required String query,
  });
}
