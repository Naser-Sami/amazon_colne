import 'package:amazon_clone/core/_core.dart';

import '/features/_features.dart';

class SearchRemoteDataSource {
  Future<List<ProductModel>> fetchSearchedProduct({
    required String query,
  }) async {
    final products = await ApiClient.get<List<ProductModel>>(
      path: '/api/products/search/$query',
      parser: (data) => List<ProductModel>.from(
        data.map((e) => ProductModel.fromMap(e)),
      ).toList(),
    );

    if (products != null) {
      return products;
    }

    return [];
  }
}
