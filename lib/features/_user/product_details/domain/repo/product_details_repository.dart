import '/features/_features.dart';

abstract class IProductDetailsRepository {
  Future<void> rateProduct({
    required ProductEntities product,
    required double rating,
  });

  Future<void> addToCart({required UserEntity user});
}
