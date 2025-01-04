import '/features/_admin/_admin.dart';

abstract class IProductDetailsRepository {
  Future<void> rateProduct({
    required ProductEntities product,
    required double rating,
  });

  Future<void> addToCart({required ProductEntities product});
}
