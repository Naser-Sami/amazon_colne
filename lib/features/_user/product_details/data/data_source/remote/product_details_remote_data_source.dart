import 'dart:developer';

import '/core/_core.dart';
import '/features/_features.dart';

class ProductDetailsRemoteDataSource {
  Future<void> rateProduct({
    required ProductModel product,
    required double rating,
  }) async {
    await ApiClient.post(
      path: '/api/rate-product',
      data: {
        'id': product.id,
        'rating': rating,
      },
    );
  }

  Future<void> addToCart({required UserModel user}) async {
    log("__________ USER MODEL __________ $user");
    await ApiClient.post(
      path: '/api/add-to-cart',
      data: {
        'id': user.id,
      },
    );
  }
}
